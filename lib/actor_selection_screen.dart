import 'package:flutter/material.dart';
import 'package:supreme_kai_world/actor/actor_card.dart';
import 'package:supreme_kai_world/game.dart';
import 'package:supreme_kai_world/util/pixel_button.dart';

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
      body: Stack(
        children: [
          _titleScreen(),
          _gitHubRepo(context),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Feito por JosManoel',
              style: TextStyle(
                fontFamily: 'PixelifySans',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
            PixelButton(
              text: 'about', 
              backgroundColor: Colors.black45,
              fontColor: Colors.grey,
              fontSize: 16.0,
              context: context,
              withShadow: false,
              onTap: () {
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

  Container _titleScreen() {
    return Container(
      margin: EdgeInsets.all(28),
      child: Center(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _gameTitle(context),
                SizedBox(width: 64),
                _selectActor(context),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _gameTitle(context),
                _selectActor(context),
                SizedBox(height: 8),
              ],
            );
          }
        }),
      ),
    );
  }

  Container _gameTitle(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 512,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
          ),
          SizedBox(height: 36),
          PixelButton(
            text: 'Play',
            context: context,
            withAnimation: true,
            onTap: () {
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
    );
  }

  Container _selectActor(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
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
            icon: const Icon(Icons.arrow_forward),
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
    );
  }

  Positioned _gitHubRepo(BuildContext context) {
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
                  Game(actorType: _actors[_currentActorIndex]),
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
