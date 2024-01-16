import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/actor.dart';

class Game extends StatelessWidget {
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
            ),
            player: Actor(Vector2(400, 480), actorType: 'princess'),
            cameraConfig:CameraConfig(
              moveOnlyMapArea: true, 
              movementWindow: Vector2(36,36),
              speed: 2.0,
              zoom:  3.5,
              startFollowPlayer: true,
            ),
          ),
        ],
      ),
    );
  }
}
