import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/avatar/avatar.dart';
import 'package:supreme_kai_world/maps/level_main/level_main_objects.dart';
import 'package:supreme_kai_world/util/game_camera_config.dart';
import 'package:supreme_kai_world/util/game_controls.dart';

import 'package:supreme_kai_world/interface/game_hud.dart';

class LevelMain extends StatelessWidget {
  final String avatarType;

  const LevelMain({super.key, required this.avatarType});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          BonfireWidget(
            interface: GameHud(),
            showCollisionArea: false,
            joystick: GameControls(usePhysicsJoystick: true),
            map: WorldMapByTiled(
              TiledReader.asset('tiled/map.json'),
              objectsBuilder: levelMainObjects(context, avatarType),
            ),
            player: Avatar(
              avatarType,
              avatarPosition: Vector2(400, 480),
            ),
            cameraConfig: gameCameraConfig,
          ),
        ],
      ),
    );
  }
}
