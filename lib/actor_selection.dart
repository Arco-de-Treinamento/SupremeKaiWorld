import 'package:flutter/material.dart';
import 'package:supreme_kai_world/game.dart';

class ActorSelection extends StatelessWidget {
  final List<String> _actors = ['cave_girl', 'inspector', 'princess', 'ninja', 'samurai'];

  @override build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _actors.length,
          itemBuilder: (context, index) => actorCard(_actors[index], context),
        ),
      ),
    ); 
  }

  Card actorCard(String actor, BuildContext context) {
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

