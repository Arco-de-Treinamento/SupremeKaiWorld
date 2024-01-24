import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'dart:async' as async;
import 'package:supreme_kai_world/actor/actor.dart';

class InteractiveDecoration extends GameDecoration {
  Actor? actor;
  final VoidCallback onCollisionAction;
  VoidCallback? onCollisionEndAction;
  final BuildContext context;
  final int amount;
  final Vector2 textureSize;
  final double stepTime;
  final Vector2 elementPosition;

  InteractiveDecoration(String spritePath,
      {required this.onCollisionAction,
      required this.context,
      this.amount = 5,
      required this.textureSize,
      this.stepTime = 0.1,
      required this.elementPosition,
      this.onCollisionEndAction,
      this.actor})
      : super.withAnimation(
          animation: SpriteAnimation.load(
            spritePath,
            SpriteAnimationData.sequenced(
              amount: amount,
              stepTime: stepTime,
              textureSize: textureSize,
            ),
          ),
          position: elementPosition,
          size: textureSize,
        );

  @override
  async.Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: textureSize,
        isSolid: true,
      ),
    );
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Actor) {
      onCollisionAction.call();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is Actor) {
      onCollisionEndAction?.call();
    }
    super.onCollisionEnd(other);
  }
}
