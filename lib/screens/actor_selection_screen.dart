import 'package:flutter/material.dart';
import 'package:supreme_kai_world/maps/level_1/level.dart';
import 'package:supreme_kai_world/util/github_button.dart';
import 'package:supreme_kai_world/util/retrotext_button.dart';
import 'package:supreme_kai_world/screens/about_screen.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';
import 'package:supreme_kai_world/util/select_player_widget.dart';
import 'package:supreme_kai_world/util/sprite.dart';

class ActorSelection extends StatefulWidget {
  @override
  _ActorSelectionState createState() => _ActorSelectionState();
}

class _ActorSelectionState extends State<ActorSelection> {
  String _selectedActor = 'cave_girl';

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
      margin: const EdgeInsets.all(28),
      child: Center(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _gameTitle(context),
                const SizedBox(width: 64),
                SelectPlayerWidget(onActorSelected: (actor) {
                  _selectedActor = actor;
                }),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _gameTitle(context),
                SelectPlayerWidget(
                  onActorSelected: (actor) {
                    _selectedActor = actor;
                  },
                ),
                const SizedBox(height: 8),
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
          Sprite(
            'assets/images/logo.png',
            heightSprite: 204,
            widthSprite: 512,
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
                  builder: (context) => Level(actorType: _selectedActor),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
