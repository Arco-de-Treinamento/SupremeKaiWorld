import 'package:bonfire/bonfire.dart';

class ActorSpriteSheet {
  final String actorPath;

  ActorSpriteSheet({required this.actorPath});

  SimpleDirectionAnimation actorAnimations() => SimpleDirectionAnimation(
        idleUp: idleUp(),
        idleDown: idleDown(),
        idleLeft: idleLeft(),
        runUp: runUp(),
        idleRight: idleRight(),
        runDown: runDown(),
        runLeft: runLeft(),
        runRight: runRight(),
      );

  Future<SpriteAnimation> idleUp() => SpriteAnimation.load(
        "actor/$actorPath/idle_back.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> idleDown() => SpriteAnimation.load(
        "actor/$actorPath/idle_front.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> idleRight() => SpriteAnimation.load(
        "actor/$actorPath/idle_right.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> idleLeft() => SpriteAnimation.load(
        "actor/$actorPath/idle_left.png",
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> runUp() => SpriteAnimation.load(
        "actor/$actorPath/walk_back.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> runDown() => SpriteAnimation.load(
        "actor/$actorPath/walk_front.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> runRight() => SpriteAnimation.load(
        "actor/$actorPath/walk_right.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> runLeft() => SpriteAnimation.load(
        "actor/$actorPath/walk_left.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  Future<SpriteAnimation> item() => SpriteAnimation.load(
        "actor/$actorPath/item.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
}
