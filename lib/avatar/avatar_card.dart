import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';

class AvatarCard extends StatefulWidget {
  final String avatarFaceset;

  const AvatarCard({
    super.key,
    required this.avatarFaceset,
  });

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Container(
          margin: EdgeInsets.only(bottom: _animation.value * 10),
          child: child,
        );
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 128,
              width: 128,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: GamePalette.primaryShadow,
                    blurRadius: 0,
                    offset: Offset(8, 8),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/facesets/${widget.avatarFaceset}.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.none,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              (widget.avatarFaceset.replaceAll('_', ' ')).toUpperCase(),
              style: GameTextStyle.titleMedium.secondary.copyWith(
                color: GamePalette.secondary,
              ),
            ),
          ],
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
