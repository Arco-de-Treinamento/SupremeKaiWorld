import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';
import 'package:supreme_kai_world/util/license_widget.dart';
import 'package:supreme_kai_world/util/sprite.dart';
import 'package:supreme_kai_world/util/sprite_button.dart';
import 'package:supreme_kai_world/util/retrotext_button.dart';
import 'package:supreme_kai_world/util/laucher_link.dart';

class AboutGame extends StatefulWidget {
  const AboutGame({super.key});

  @override
  _AboutGameState createState() => _AboutGameState();
}

class _AboutGameState extends State<AboutGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF686557),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: GamePalette.secondary,
        centerTitle: true,
        elevation: 0,
        leading: SpriteButton(
          'assets/images/items/arrow.png',
          heightSprite: 24,
          widthSprite: 24,
          margin: 12,
          isFlippedHorizontally: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sobre este projeto',
          style: GameTextStyle.titleLarge.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              buildLogo(),
              buildLicenseList(),
              buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48.0),
      child: const Sprite(
        'assets/images/logo.png',
        heightSprite: 75,
        widthSprite: 197,
      ),
    );
  }

  Widget buildLicenseList() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Container(
        margin: const EdgeInsets.all(28),
        child: const Column(
          children: [
            LicenseInfoWidget(
              'Arco de Treinamento',
              licenseContent:
                  'Esse projeto visa agrupar todos os repositórios produzidos pelo autor em cursos e certificações com o intuito de facilitar o acesso por terceiros, criado para funcionar como um portifólio interativo, utilizando os assets do "Ninja Adventure Asset Pack" e fonte "Pixelify Sans", sob a licença MIT.',
              licenseTagPath: 'assets/images/tags/MIT.png',
              repositoryLink: 'https://github.com/Arco-de-Treinamento',
            ),
            SizedBox(height: 24.0),
            LicenseInfoWidget(
              'Ninja Adventure Asset Pack',
              licenseContent:
                  'Assets criados por Pixel-Boy e AAA disponíveis na itch.io, sob a licença Creative Commons Zero (CC0).',
              licenseTagPath: 'assets/images/tags/cc-zero.png',
              repositoryLink:
                  'https://pixel-boy.itch.io/ninja-adventure-asset-pack',
            ),
            SizedBox(height: 24.0),
            LicenseInfoWidget(
              'Pixelify Sans',
              licenseContent:
                  'Fonte criada por Stefie Justprince/Typecalism Foundryline, disponível no Google Fonts e no GitHub, sob a licença OFL 1.1.',
              licenseTagPath: 'assets/images/tags/OFL.png',
              repositoryLink: 'https://github.com/eifetx/Pixelify-Sans',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      color: GamePalette.secondary,
      child: Container(
        margin: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Outros Links',
              style: GameTextStyle.titleMedium.primary,
            ),
            const SizedBox(height: 16),
            buildRetroTextButton(
              'Bonfire 🡵',
              'https://bonfire-engine.github.io/#/',
            ),
            buildRetroTextButton(
              'JosManoel 🡵',
              'https://github.com/JosManoel',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright (c) 2024 Manoel Freitas',
                  style: GameTextStyle.bodyTextSmall.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRetroTextButton(String text, String url) {
    return RetroTextButton(
      text,
      buttonColor: GamePalette.secondary,
      textStyle: GameTextStyle.buttonSmall.primary
          .copyWith(decoration: TextDecoration.underline),
      withShadow: false,
      horizontalPadding: 0,
      onPressed: () => launchWebLink(url),
    );
  }
}
