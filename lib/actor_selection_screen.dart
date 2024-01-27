import 'package:flutter/material.dart';
import 'package:supreme_kai_world/actor/actor_card.dart';
import 'package:supreme_kai_world/game.dart';
import 'package:supreme_kai_world/util/github_button.dart';
import 'package:supreme_kai_world/util/retrotext_button.dart';
import 'package:supreme_kai_world/about_screen.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';
import 'package:supreme_kai_world/util/sprite_button.dart';

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
      backgroundColor: GamePalette.background,
      body: Stack(
        children: [
          _titleScreen(),
          const GitHubLinkButton(),
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
            RetroTextButton(
              'about',
              buttonColor: GamePalette.secondary,
              textStyle: GameTextStyle.buttonSmall.primary,
              withShadow: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutGame(),
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
          RetroTextButton(
            'Play',
            textStyle: GameTextStyle.buttonLarge.primary,
            buttonColor: GamePalette.secondary,
            withAnimation: true,
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
    );
  }

  Container _selectActor(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpriteButton(
            'assets/images/items/arrow.png',
            heightSprite: 40.42,
            widthSprite: 40.42,
            isFlippedHorizontally: true,
            onPressed: () {
              setState(() {
                if (_currentActorIndex <= 0) {
                  _currentActorIndex = _actors.length;
                }
                _currentActorIndex--;
              });
            },
          ),
          ActorCard(actor: _actors[_currentActorIndex], context: context),
          SizedBox(width: 8.0),
          SpriteButton(
            'assets/images/items/arrow.png',
            heightSprite: 40.42,
            widthSprite: 40.42,
            onPressed: () {
              setState(() {
                if (_currentActorIndex >= _actors.length - 1) {
                  _currentActorIndex = -1;
                }
                _currentActorIndex++;
              });
            },
          ),
        ],
      ),
    );
  }
}
