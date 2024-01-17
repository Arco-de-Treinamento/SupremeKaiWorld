import 'package:flutter/material.dart';
import 'package:supreme_kai_world/game.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({
    super.key,
    required this.actor,
    required this.context,
  });

  final String actor;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => Game(actorType: actor),
            ),
          );
        },
        child: Image.asset(
          'assets/images/facesets/$actor.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
      )
    );
  }
}

