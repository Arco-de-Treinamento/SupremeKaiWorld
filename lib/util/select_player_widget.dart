import 'package:flutter/material.dart';
import 'package:supreme_kai_world/actor/actor_card.dart';
import 'package:supreme_kai_world/util/sprite_button.dart';

class SelectPlayerWidget extends StatefulWidget {
  final ValueChanged<String> onActorSelected;

  const SelectPlayerWidget({
    super.key,
    required this.onActorSelected,
  });

  @override
  _SelectPlayerWidgetState createState() => _SelectPlayerWidgetState();
}

class _SelectPlayerWidgetState extends State<SelectPlayerWidget> {
  int _currentActorIndex = 0;
  final double _sizeArrowSprite = 40.42;
  final List<String> _actors = [
    'cave_girl',
    'inspector',
    'princess',
    'ninja',
    'samurai'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpriteButton(
          'assets/images/items/arrow.png',
          heightSprite: _sizeArrowSprite,
          widthSprite: _sizeArrowSprite,
          isFlippedHorizontally: true,
          onPressed: selectPreviousPlayer,
        ),
        AvatarCard(
            avatarFaceset: _actors[_currentActorIndex]),
        const SizedBox(width: 8.0),
        SpriteButton(
          'assets/images/items/arrow.png',
          heightSprite: _sizeArrowSprite,
          widthSprite: _sizeArrowSprite,
          onPressed: selectNextPlayer,
        ),
      ],
    );
  }

  void selectNextPlayer() {
    setState(() {
      _currentActorIndex = (_currentActorIndex + 1) % _actors.length;
      widget.onActorSelected(_actors[_currentActorIndex]);
    });
  }

  void selectPreviousPlayer() {
    setState(() {
      _currentActorIndex = (_currentActorIndex - 1) % _actors.length;
      widget.onActorSelected(_actors[_currentActorIndex]);
    });
  }
}
