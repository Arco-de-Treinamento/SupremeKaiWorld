import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'dart:async' as async;
import 'package:supreme_kai_world/avatar/avatar.dart';

/// A classe [InteractiveGameDecoration] define um decoration base que interage com o player.
class InteractiveGameDecoration extends GameDecoration {
  final VoidCallback onPlayerCollisionStart;
  VoidCallback? onPlayerCollisionEnd;
  final int amount;
  final Vector2 spriteSize;
  final double stepTime;
  final Vector2 decorationPosition;

  InteractiveGameDecoration(
    String spritePath, {
    required this.onPlayerCollisionStart,
    required this.amount,
    required this.spriteSize,
    required this.stepTime,
    required this.decorationPosition,
    this.onPlayerCollisionEnd,
  }) : super.withAnimation(
          animation: SpriteAnimation.load(
            spritePath,
            SpriteAnimationData.sequenced(
              amount: amount,
              stepTime: stepTime,
              textureSize: spriteSize,
            ),
          ),
          position: decorationPosition,
          size: spriteSize,
        );

  @override
  async.Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: spriteSize,
        isSolid: true,
      ),
    );
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Avatar) {
      onPlayerCollisionStart.call();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is Avatar) {
      onPlayerCollisionEnd?.call();
    }
    super.onCollisionEnd(other);
  }
}
