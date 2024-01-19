import 'package:flutter/material.dart';
import 'package:supreme_kai_world/util/pixel_button.dart';
import 'package:supreme_kai_world/util/github_button.dart';


class AboutGame extends StatefulWidget {
  @override
  _AboutGameState createState() => _AboutGameState();
}

class _AboutGameState extends State<AboutGame> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF686557),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sobre este projeto',
          style: TextStyle(
            fontFamily: 'PixelifySans',
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
            color: Colors.white70,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(28),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Assets criados por Pixel-boy, disponíveis na itch.io com o título de "Ninja Adventure Asset Pack", sob a licença Creative Commons Zero (CC0).',
                    style: TextStyle(
                      fontFamily: 'PixelifySans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 36,
                    child: Image.asset(
                      'assets/images/cc-zero.png'
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


