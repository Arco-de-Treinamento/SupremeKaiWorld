import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/actor.dart';
import 'package:supreme_kai_world/maps/level_1/level_objects.dart';

class Level extends StatelessWidget {
  final String actorType;

  const Level({super.key, required this.actorType});

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
              objectsBuilder: levelObjects(context),
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
