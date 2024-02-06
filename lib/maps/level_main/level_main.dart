import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/avatar.dart';
import 'package:supreme_kai_world/maps/level_main/level_main_objects.dart';

class LevelMain extends StatelessWidget {
  final String avatarType;

  const LevelMain({super.key, required this.avatarType});

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
              objectsBuilder: levelMainObjects(context, avatarType),
            ),
            player: Avatar(
              avatarType,
              avatarPosition: Vector2(400, 480),
            ),
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
