import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/avatar/avatar.dart';
import 'package:supreme_kai_world/maps/level_warrior/level_warrior_objects.dart';
import 'package:supreme_kai_world/util/game_camera_config.dart';
import 'package:supreme_kai_world/util/game_controls.dart';

class LevelWarrior extends StatelessWidget {
  final String avatarType;

  const LevelWarrior({super.key, required this.avatarType});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          BonfireWidget(
              showCollisionArea: false,
              joystick: GameControls(usePhysicsJoystick: true),
              map: WorldMapByTiled(
                TiledReader.asset('tiled/warrior_map.json'),
                objectsBuilder: levelWarriorObjects(context),
              ),
              player: Avatar(
                avatarType,
                avatarPosition: Vector2(288, 288),
              ),
              cameraConfig: gameCameraConfig),
        ],
      ),
    );
  }
}
