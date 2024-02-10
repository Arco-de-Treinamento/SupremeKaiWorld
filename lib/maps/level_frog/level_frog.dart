import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/avatar/avatar.dart';
import 'package:supreme_kai_world/maps/level_frog/level_frog_objects.dart';
import 'package:supreme_kai_world/util/game_camera_config.dart';
import 'package:supreme_kai_world/util/game_controls.dart';

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
            joystick: GameControls(usePhysicsJoystick: true),
            map: WorldMapByTiled(
              TiledReader.asset('tiled/frog_map.json'),
              objectsBuilder: levelFrogObjects(context),
            ),
            player: Avatar(
              avatarType,
              avatarPosition: Vector2(400, 32),
            ),
            cameraConfig: gameCameraConfig,
          ),
        ],
      ),
    );
  }
}
