// game.dart
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/actor.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      showCollisionArea: false,
      joystick: Joystick(
        directional: JoystickDirectional(),
      ), // required
      map: WorldMapByTiled(
        TiledReader.asset('tiled/map.json'),
      ),
      player: Actor(Vector2(400, 480), actorType: 'samurai'),
      cameraConfig:CameraConfig(
        moveOnlyMapArea: true, 
        movementWindow: Vector2(50,50),
        speed: 1.0,
        zoom:  3.5,
        startFollowPlayer: true,
      ),
    );
  }
}
