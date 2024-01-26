import 'package:flutter/material.dart';

class Sprite extends StatelessWidget {
  const Sprite(
    this.assetPath, {
    super.key,
    required this.heightSprite,
    required this.widthSprite,
  });

  final String assetPath;
  final double heightSprite;
  final double widthSprite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSprite,
      width: widthSprite,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.none,
      ),
    );
  }
}
