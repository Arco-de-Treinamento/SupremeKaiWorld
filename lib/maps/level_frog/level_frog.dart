import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/avatar.dart';
import 'package:supreme_kai_world/maps/level_frog/level_frog_objects.dart';

class LevelFrog extends StatelessWidget {
  final String avatarType;

  const LevelFrog({super.key, required this.avatarType});

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
              TiledReader.asset('tiled/frog_map.json'),
              objectsBuilder: levelFrogObjects(context),
            ),
            player: Avatar(
              avatarType,
              avatarPosition: Vector2(400, 32),
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