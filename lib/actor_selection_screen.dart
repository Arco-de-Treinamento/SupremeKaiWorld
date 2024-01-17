import 'package:flutter/material.dart';
import 'package:supreme_kai_world/actor/actor_card.dart';
import 'package:supreme_kai_world/game.dart';

class ActorSelection extends StatefulWidget {
  @override
  _ActorSelectionState createState() => _ActorSelectionState();
}

class _ActorSelectionState extends State<ActorSelection> {
  final List<String> _actors = [
    'cave_girl',
    'inspector',
    'princess',
    'ninja',
    'samurai'
  ];
  int _currentActorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF686557),
      appBar: AppBar(
        title: const Text('Supreme Kai World'),
        actions: [
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Game(actorType: _actors[_currentActorIndex]),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/facesets/cave_girl.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      if (_currentActorIndex > 0) {
                        _currentActorIndex--;
                      }
                    });
                  },
                ),
                ActorCard(actor: _actors[_currentActorIndex], context: context),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      if (_currentActorIndex < _actors.length - 1) {
                        _currentActorIndex++;
                      }
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Play'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Game(actorType: _actors[_currentActorIndex]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Feito por JosManoel'),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Game(actorType: _actors[_currentActorIndex]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
