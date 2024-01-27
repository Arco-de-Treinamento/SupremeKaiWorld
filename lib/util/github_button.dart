import 'package:flutter/material.dart';
import 'package:supreme_kai_world/util/laucher_link.dart';
import 'package:supreme_kai_world/util/sprite_button.dart';

class GitHubLinkButton extends StatelessWidget {
  const GitHubLinkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: SpriteButton(
        'assets/images/items/github.png',
        onPressed: () => laucherLink(
            'https://github.com/Arco-de-Treinamento/SupremeKaiWorld'),
        heightSprite: 64,
        widthSprite: 64,
        withAnimation: false,
        margin: 0.0,
      ),
    );
  }
}
