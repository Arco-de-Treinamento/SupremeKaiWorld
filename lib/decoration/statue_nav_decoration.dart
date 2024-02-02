import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/decoration/interactive_game_decoration.dart';

/// A classe [StatueNavigationDecoration] define um decoration base que interage com o player e navega para uma outra tela.
class StatueNavigationDecoration extends InteractiveGameDecoration {
  final String spritePath;
  final Vector2 decorationPosition;
  final VoidCallback navigationAction;

  StatueNavigationDecoration(
    this.spritePath, {
    required this.decorationPosition,
    required this.navigationAction,
  }) : super(
          spritePath,
          amount: 5,
          stepTime: 0.1,
          spriteSize: Vector2(32.0, 32.0),
          onPlayerCollisionStart: navigationAction,
          decorationPosition: decorationPosition,
        );
}
