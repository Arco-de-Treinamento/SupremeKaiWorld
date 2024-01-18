import 'package:flutter/material.dart';

class ActorCard extends StatefulWidget {
  const ActorCard({
    super.key,
    required this.actor,
    required this.context,
  });

  final String actor;
  final BuildContext context;

  @override
  State<ActorCard> createState() => _ActorCardState();
}

class _ActorCardState extends State<ActorCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 0,
                    offset: const Offset(8, 8),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/facesets/${widget.actor}.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.none,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              (widget.actor.replaceAll('_', ' ')).toUpperCase(),
              style: const TextStyle(
                fontFamily: 'PixelifySans',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF141B1B),
              ),
            ),
          ],
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
