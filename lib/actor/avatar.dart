import 'dart:core';
import 'dart:async' as async;
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/actor/avatar_spritesheet.dart';

class Avatar extends SimplePlayer with BlockMovementCollision {
  late final AvatarSpriteSheet avatarSpriteSheet;
  final String avatarType;
  Vector2 avatarPosition;

  Avatar(this.avatarType, {required this.avatarPosition})
      : super(
          position: avatarPosition,
          size: Vector2(16.0, 16.0),
          speed: 100,
        ) {
    avatarSpriteSheet = AvatarSpriteSheet(avatarType);
    animation = avatarSpriteSheet.avatarAnimations();
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
