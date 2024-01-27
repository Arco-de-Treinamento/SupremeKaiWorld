import 'package:flutter/material.dart';
import 'package:supreme_kai_world/util/sprite.dart';

class SpriteButton extends StatefulWidget {
  const SpriteButton(
    this.assetPath, {
    super.key,
    required this.onPressed,
    required this.heightSprite,
    required this.widthSprite,
    this.margin = 4.0,
    this.isFlippedHorizontally = false,
    this.isFlippedVertically = false,
    this.withAnimation = true,
    this.animationTime = 200,
  });

  final String assetPath;
  final VoidCallback onPressed;
  final double heightSprite;
  final double widthSprite;
  final double margin;
  final bool withAnimation;
  final int animationTime;
  final bool isFlippedHorizontally;
  final bool isFlippedVertically;

  @override
  State<SpriteButton> createState() => _SpriteButtonState();
}

class _SpriteButtonState extends State<SpriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  static const double _beginAnimation = 1.0;
  static const double _endAnimation = 0.5;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.animationTime),
      vsync: this,
    );
  }

  void _handleTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget.margin),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTap: widget.onPressed,
        child: Transform.flip(
          flipX: widget.isFlippedHorizontally,
          flipY: widget.isFlippedVertically,
          child: FadeTransition(
            opacity: widget.withAnimation
                ? _animationController.drive(Tween(begin: _beginAnimation, end: _endAnimation))
                : const AlwaysStoppedAnimation(_beginAnimation),
            child: Sprite(widget.assetPath,
                heightSprite: widget.heightSprite,
                widthSprite: widget.widthSprite),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
