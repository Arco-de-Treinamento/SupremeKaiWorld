import 'package:flutter/material.dart';

class PixelButton extends StatefulWidget {
  const PixelButton({
    super.key,
    this.backgroundColor = Colors.black,
    required this.text,
    this.fontSize = 28.0,
    required this.onTap,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.w600,
    required this.context,
    this.withAnimation = false,
    this.withShadow = true,
  });

  final Color backgroundColor;
  final Color fontColor;
  final FontWeight fontWeight;
  final String text;
  final double fontSize;
  final VoidCallback onTap;
  final BuildContext context;
  final bool withAnimation;
  final bool withShadow;

  @override
  State<PixelButton> createState() => _PixelButtonState();
}

class _PixelButtonState extends State<PixelButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 8.0).animate(_controller);
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
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              boxShadow: [
                widget.withShadow
                    ? BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 0,
                        offset: widget.withAnimation
                            ? Offset(_animation.value, _animation.value)
                            : const Offset(8, 8),
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
            style: TextStyle(
              fontFamily: 'PixelifySans',
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.fontColor,
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
