import 'dart:async';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';
import 'package:supreme_kai_world/util/github_button.dart';
import 'package:supreme_kai_world/util/retrotext_button.dart';
import 'package:supreme_kai_world/util/sprite.dart';
import 'package:supreme_kai_world/util/select_player_widget.dart';
import 'package:supreme_kai_world/screens/about_screen.dart';
import 'package:supreme_kai_world/maps/level_1/level.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  String _selectedActor = 'cave_girl';
  late PackageInfo _packageInfo;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GamePalette.background,
      body: Stack(
        children: [
          gameScreen(),
          const GitHubLinkButton(),
        ],
      ),
      bottomNavigationBar: gameBottom(context),
    );
  }

  Widget gameScreen() {
    return Container(
      margin: const EdgeInsets.all(28),
      child: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gameTitle(context),
                  const SizedBox(width: 64),
                  SelectPlayerWidget(
                    onActorSelected: (actor) {
                      _selectedActor = actor;
                    },
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gameTitle(context),
                  SelectPlayerWidget(
                    onActorSelected: (actor) {
                      _selectedActor = actor;
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget gameTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Sprite(
          'assets/images/logo.png',
          heightSprite: 195,
          widthSprite: 512,
        ),
        const SizedBox(height: 24),
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
        const SizedBox(height: 8),
        Text(
          "Selecione seu player !",
          style: GameTextStyle.bodyTextMedium.primary
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget gameBottom(BuildContext context) {
    return BottomAppBar(
      height: 48,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _packageInfo.version,
            style: GameTextStyle.bodyTextSmall.primary,
          ),
          Text(
            'Feito por @JosManoel',
            style: GameTextStyle.bodyTextSmall.primary,
          ),
          RetroTextButton(
            'about',
            buttonColor: GamePalette.secondary,
            textStyle: GameTextStyle.buttonSmall.primary,
            withShadow: false,
            horizontalPadding: 0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutGame(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
