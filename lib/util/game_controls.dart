import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';

Joystick GameControls({bool usePhysicsJoystick = false}) {
  return Joystick(
    directional: JoystickDirectional(
      isFixed: false,
    ),
    keyboardConfig: KeyboardConfig(
      enable: usePhysicsJoystick,
      directionalKeys: KeyboardDirectionalKeys.arrows(),
      acceptedKeys: [
        LogicalKeyboardKey.space,
      ],
    ),
  );
}
