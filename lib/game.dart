import 'package:bonfire/tiled/builder/tiled_world_builder.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/actor.dart';
import 'package:supreme_kai_world/decoration/interactive_decoration.dart';

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
      'frog_statue': (p) => InteractiveDecoration(
            'decorations/frog_statue.png',
            context: context,
            textureSize: Vector2(32.0, 32.0),
            onCollisionAction: () => {Navigator.pop(context)},
            elementPosition: p.position,
          ),
      'monk_statue': (p) => InteractiveDecoration(
            'decorations/monk_statue.png',
            context: context,
            textureSize: Vector2(32.0, 32.0),
            onCollisionAction: () => {debugPrint("entrou monge")},
            elementPosition: p.position,
            onCollisionEndAction: () => {debugPrint("saiu monge")}
          ),
      'warrior_statue': (p) => InteractiveDecoration(
            'decorations/warrior_statue.png',
            context: context,
            amount: 4,
            textureSize: Vector2(32.0, 32.0),
            onCollisionAction: () => {Navigator.pop(context)},
            elementPosition: p.position,
          ),
      'warrior_info': (p) => infoBoardDefault(context, p),
      'monk_info': (p) => infoBoardDefault(context, p),
      'frog_info': (p) => infoBoardDefault(context, p),
    };
  }

  InteractiveDecoration infoBoardDefault(BuildContext context, TiledObjectProperties p) {
    return InteractiveDecoration(
      'decorations/info_board.png',
      context: context,
      amount: 4,
      stepTime: 0.3,
      textureSize: Vector2(32.0, 32.0),
      onCollisionAction: () => {debugPrint("info")},
      elementPosition: p.position,
    );
  }
}
