import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class MenuComponent extends InterfaceComponent {
  MenuComponent()
      : super(
          id: 2,
          position: Vector2(24, 24),
          spriteUnselected: Sprite.load('HUD/pause_button.png'),
          size: Vector2(58, 58),
        );

  @override
  void onTap() {
    debugPrint("PAUSE");
  }
}
