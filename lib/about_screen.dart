import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(28),
            child: Center(
              child: LicenseWidget(
                title: 'Ninja Adventure Asset Pack',
                menssage:
                    'Assets criados por Pixel-Boy e AAA disponíveis na itch.io, sob licença Creative Commons Zero (CC0).',
                licenseTagPath: 'assets/images/tags/cc-zero.png',
                repoLink:
                    'https://pixel-boy.itch.io/ninja-adventure-asset-pack',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LicenseWidget extends StatelessWidget {
  const LicenseWidget({
    super.key,
    required this.menssage,
    required this.licenseTagPath,
    required this.repoLink,
    required this.title,
  });

  final String title;
  final String menssage;
  final String licenseTagPath;
  final String repoLink;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'PixelifySans',
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  menssage,
                  style: const TextStyle(
                    fontFamily: 'PixelifySans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16.0),
                height: 36,
                child: Image.asset(licenseTagPath),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PixelButton(
                text: 'Ir para a página',
                backgroundColor: Colors.black45,
                fontColor: Colors.white,
                fontSize: 14.0,
                context: context,
                withShadow: false,
                onTap: () =>_laucherURL(repoLink),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> _laucherURL (String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
