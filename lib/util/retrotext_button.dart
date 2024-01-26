import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';

class RetroTextButton extends StatefulWidget {
  const RetroTextButton(
    this.text, {
    super.key,
    required this.textStyle,
    required this.onTap,
    this.shadowOffset = 8.0,
    this.verticalPadding = 0.0,
    this.horizontalPadding = 16.0,
    this.animationDuration = 100,
    this.backgroundColor = GamePalette.primary,
    this.withAnimation = false,
    this.withShadow = true,
  });

  final String text;
  final TextStyle textStyle;
  final VoidCallback onTap;
  final double shadowOffset;
  final double verticalPadding;
  final double horizontalPadding;
  final int animationDuration;
  final Color backgroundColor;
  final bool withAnimation;
  final bool withShadow;

  @override
  State<RetroTextButton> createState() => _RetroTextButtonState();
}

class _RetroTextButtonState extends State<RetroTextButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.animationDuration),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: widget.shadowOffset).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _controller.forward(),
      onExit: (event) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: widget.verticalPadding,
                horizontal: widget.horizontalPadding),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              boxShadow: [
                widget.withShadow
                    ? BoxShadow(
                        color: GamePalette.primaryShadow,
                        blurRadius: 0,
                        offset: widget.withAnimation
                            ? Offset(_animation.value, _animation.value)
                            : Offset(widget.shadowOffset, widget.shadowOffset),
                      )
                    : const BoxShadow(),
              ],
            ),
            child: child,
          );
        },
        child: InkWell(
          hoverColor: Colors.transparent,
          onTap: widget.onTap,
          child: Text(
            widget.text,
            style: widget.textStyle,
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
