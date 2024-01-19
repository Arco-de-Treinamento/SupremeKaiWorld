import 'package:flutter/material.dart';
import 'package:supreme_kai_world/game.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Game(actorType: 'cave_girl'),
            ),
          );
        },
        child: SizedBox(
          height: 64,
          width: 64,
          child: Image.asset(
            'assets/images/items/github.png',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
          ),
        ),
      ),
    );
  }
}
