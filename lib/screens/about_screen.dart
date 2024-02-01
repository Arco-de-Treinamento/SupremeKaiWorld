import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';
import 'package:supreme_kai_world/util/license_widget.dart';
import 'package:supreme_kai_world/util/sprite_button.dart';

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
        child: Container(
          margin: const EdgeInsets.all(28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: const Column(
                children: [
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
                  SizedBox(height: 24.0),
                  LicenseInfoWidget(
                    'Arco de Treinamento',
                    licenseContent:
                        'Esse projeto visa agrupar todos os projetos produzidos em cursos e certificações a fim de facilitar o seu acesso por terceiros. Esse jogo foi criado para funcionar como um portifólio interativo e utiliza os assets do "Ninja Adventure Asset Pack" e a fonte "Pixelify Sans". Esse projeto está sob licença MIT.',
                    licenseTagPath: 'assets/images/tags/MIT.png',
                    repositoryLink: 'https://github.com/Arco-de-Treinamento',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
