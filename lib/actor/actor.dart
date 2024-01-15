import 'dart:async' as async;
import 'dart:core';

import 'package:supreme_kai_world/actor/spritesheet.dart';
import 'package:bonfire/bonfire.dart';

class Actor extends SimplePlayer with  BlockMovementCollision{
  late final ActorSpriteSheet actorSpriteSheet;
  final String actorType;

  Actor(Vector2 position,{required this.actorType})
      : super(
          position: position,
          size: Vector2(16.0, 16.0),
          speed: 100,
        ) {
    actorSpriteSheet = ActorSpriteSheet(actorPath: actorType);
    animation = actorSpriteSheet.actorAnimations();
  }

  @override
  async.Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(16.0, 16.0),
      ),
    );
    return super.onLoad();
  }
}
