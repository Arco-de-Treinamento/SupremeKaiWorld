import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';

class SwordComponent extends InterfaceComponent {
  int _swordCount = 0;
  double _padding = 24.0;

  SwordComponent()
      : super(
          id: 1,
          position: Vector2(24, 24),
          spriteUnselected: Sprite.load('HUD/sword_icon.png'),
          size: Vector2(64, 64),
        );

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _drawSwordCount(canvas);
  }

  void _drawSwordCount(Canvas canvas) {
    TextPainter tp = TextPainter(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'x',
            style: GameTextStyle.titleMedium.primary,
          ),
          TextSpan(
            text: _swordCount.toString(),
            style: GameTextStyle.titleLarge.primary.copyWith(fontSize: 48.0),
          ),
        ],
      ),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas, Offset(64, 0));
  }
}
