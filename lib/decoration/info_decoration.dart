import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/decoration/interactive_decoration.dart';

class InfoDecoration extends InteractiveGameDecoration {
  final String informationText;
  final Vector2 decorationPosition;

  InfoDecoration(
    this.informationText, {
    required this.decorationPosition,
  }) : super(
          'decorations/info_board.png',
          amount: 4,
          stepTime: 0.3,
          spriteSize: Vector2(32.0, 32.0),
          onPlayerCollisionStart: () => {debugPrint(informationText)},
          decorationPosition: decorationPosition,
        );
}
