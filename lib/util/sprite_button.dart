import 'package:flutter/material.dart';

class SpriteButton extends StatefulWidget {
  const SpriteButton({
    super.key,
    required this.onTap,
    required this.context,
    required this.imagePath,
    this.heightSprite = 16.0,
    this.widthSprite = 16.0,
    this.borderSize = 4.0,
    this.flipHorizontal = false,
    this.flipVertical = false,
    this.withAnimation = true,
  });

  final String imagePath;
  final VoidCallback onTap;
  final BuildContext context;
  final double heightSprite;
  final double widthSprite;
  final double borderSize;
  final bool flipHorizontal;
  final bool flipVertical;
  final bool withAnimation;

  @override
  State<SpriteButton> createState() => _SpriteButtonState();
}

class _SpriteButtonState extends State<SpriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget.borderSize),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: widget.onTap,
        child: Transform.flip(
          flipX: widget.flipHorizontal,
          flipY: widget.flipVertical,
          child: SizedBox(
            height: widget.heightSprite,
            width: widget.widthSprite,
            child: FadeTransition(
              opacity: widget.withAnimation ? _controller.drive(Tween(begin: 1.0, end: 0.5)) : const AlwaysStoppedAnimation(1.0),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
