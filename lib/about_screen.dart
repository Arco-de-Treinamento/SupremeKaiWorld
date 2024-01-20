import 'package:flutter/material.dart';
import 'package:supreme_kai_world/util/license_widget.dart';
import 'package:supreme_kai_world/util/pixel_button.dart';

class AboutGame extends StatefulWidget {
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
        leading: PixelButton(
          text: '<',
          backgroundColor: Colors.black45,
          fontColor: Colors.white,
          fontSize: 14.0,
          context: context,
          withShadow: false,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Sobre este projeto',
          style: TextStyle(
            fontFamily: 'PixelifySans',
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(28),
          child: const Center(
            child: Column(
              children: [
                LicenseWidget(
                  title: 'Ninja Adventure Asset Pack',
                  menssage:
                      'Assets criados por Pixel-Boy e AAA disponíveis na itch.io, sob a licença Creative Commons Zero (CC0).',
                  licenseTagPath: 'assets/images/tags/cc-zero.png',
                  repoLink:
                      'https://pixel-boy.itch.io/ninja-adventure-asset-pack',
                ),
                SizedBox(height: 24.0),
                LicenseWidget(
                  title: 'Pixelify Sans',
                  menssage:
                      'Fonte criada por Stefie Justprince/Typecalism Foundryline, disponível no Google Fonts e no GitHub, sob a licença OFL 1.1.',
                  licenseTagPath: 'assets/images/tags/OFL.png',
                  repoLink: 'https://github.com/eifetx/Pixelify-Sans',
                ),
                SizedBox(height: 24.0),
                LicenseWidget(
                  title: 'Arco de Treinamento',
                  menssage:
                      'Esse projeto visa agrupar todos os projetos produzidos em cursos e certificações a fim de facilitar o seu acesso por terceiros. Esse jogo foi criado para funcionar como um portifólio interativo e utiliza os assets do "Ninja Adventure Asset Pack" e a fonte "Pixelify Sans". Esse projeto está sob licença MIT.',
                  licenseTagPath: 'assets/images/tags/MIT.png',
                  repoLink: 'https://github.com/Arco-de-Treinamento',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

