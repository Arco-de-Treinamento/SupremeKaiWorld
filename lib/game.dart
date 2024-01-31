import 'package:bonfire/tiled/builder/tiled_world_builder.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/actor.dart';
import 'package:supreme_kai_world/decoration/interactive_decoration.dart';
import 'package:supreme_kai_world/decoration/info_decoration.dart';

class Game extends StatelessWidget {
  final String actorType;

  const Game({super.key, required this.actorType});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          BonfireWidget(
            showCollisionArea: false,
            joystick: Joystick(
              directional: JoystickDirectional(),
            ),
            map: WorldMapByTiled(
              TiledReader.asset('tiled/map.json'),
              objectsBuilder: iteractiveObjects(context),
            ),
            player: Actor(Vector2(400, 480), actorType: actorType),
            cameraConfig: CameraConfig(
              moveOnlyMapArea: true,
              movementWindow: Vector2(36, 36),
              speed: 2.0,
              zoom: 3.5,
              startFollowPlayer: true,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, ObjectBuilder> iteractiveObjects(BuildContext context) {
    return {
      'frog_statue': (p) => InteractiveGameDecoration(
            'decorations/frog_statue.png',
            spriteSize: Vector2(32.0, 32.0),
            onPlayerCollisionStart: () => {Navigator.pop(context)},
            decorationPosition: p.position,
            amount: 5,
            stepTime: 0.1,
          ),
      'monk_statue': (p) => InteractiveGameDecoration(
          'decorations/monk_statue.png',
          spriteSize: Vector2(32.0, 32.0),
          onPlayerCollisionStart: () => {debugPrint("entrou monge")},
          decorationPosition: p.position,
          onPlayerCollisionEnd: () => {debugPrint("saiu monge")},
          amount: 5,
          stepTime: 0.1),
      'warrior_statue': (p) => InteractiveGameDecoration(
            'decorations/warrior_statue.png',
            amount: 4,
            spriteSize: Vector2(32.0, 32.0),
            onPlayerCollisionStart: () => {Navigator.pop(context)},
            decorationPosition: p.position,
            stepTime: 0.1,
          ),
      'warrior_info': (p) => InfoDecoration(
        'warrior info placa',
        decorationPosition: p.position,
      ),
      'monk_info': (p) => InfoDecoration(
        'monk info placa',
        decorationPosition: p.position,
      ),
      'frog_info': (p) => InfoDecoration(
        'frog info placa',
        decorationPosition: p.position,
      ),
    };
  }
}
