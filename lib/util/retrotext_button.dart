import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';

class RetroTextButton extends StatefulWidget {
  const RetroTextButton(
    this.buttonText, {
    super.key,
    required this.textStyle,
    required this.onPressed,
    this.shadowOffset = 8.0,
    this.verticalPadding = 0.0,
    this.horizontalPadding = 16.0,
    this.animationTime = 100,
    this.buttonColor = GamePalette.primary,
    this.withAnimation = false,
    this.withShadow = true,
  });

  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final double shadowOffset;
  final double verticalPadding;
  final double horizontalPadding;
  final int animationTime;
  final Color buttonColor;
  final bool withAnimation;
  final bool withShadow;

  @override
  State<RetroTextButton> createState() => _RetroTextButtonState();
}

class _RetroTextButtonState extends State<RetroTextButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _shadowAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.animationTime),
      vsync: this,
    );

    _shadowAnimation = Tween(begin: 0.0, end: widget.shadowOffset)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _animationController.forward(),
      onExit: (event) => _animationController.reverse(),
      child: AnimatedBuilder(
        animation: _shadowAnimation,
        builder: (_, child) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: widget.verticalPadding,
                horizontal: widget.horizontalPadding),
            decoration: BoxDecoration(
              color: widget.buttonColor,
              boxShadow: [
                widget.withShadow
                    ? BoxShadow(
                        color: GamePalette.primaryShadow,
                        blurRadius: 0,
                        offset: widget.withAnimation
                            ? Offset(
                                _shadowAnimation.value, _shadowAnimation.value)
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
          onTap: widget.onPressed,
          child: Text(
            widget.buttonText,
            style: widget.textStyle,
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
