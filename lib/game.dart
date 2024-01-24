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
            showCollisionArea: true,
            joystick: Joystick(
              directional: JoystickDirectional(),
            ),
            map: WorldMapByTiled(
              TiledReader.asset('tiled/map.json'),
              objectsBuilder: {
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
              },
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
}
