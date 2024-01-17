import 'package:flutter/material.dart';
import 'package:supreme_kai_world/actor/actor_card.dart';

class ActorSelection extends StatelessWidget {
  final List<String> _actors = ['cave_girl', 'inspector', 'princess', 'ninja', 'samurai'];

  @override build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _actors.length,
          itemBuilder: (context, index) => ActorCard(actor: _actors[index], context: context),
        ),
      ),
    ); 
  }
}