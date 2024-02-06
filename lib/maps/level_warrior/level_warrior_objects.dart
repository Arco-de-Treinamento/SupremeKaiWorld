import 'package:flutter/material.dart';
import 'package:bonfire/tiled/builder/tiled_world_builder.dart';
import 'package:supreme_kai_world/decoration/statue_nav_decoration.dart';

Map<String, ObjectBuilder> levelWarriorObjects(BuildContext context) {
  return {
   'warrior_statue': (p) => StatueNavigationDecoration(
          'decorations/warrior_statue.png',
          decorationPosition: p.position,
          navigationAction: () => {Navigator.pop(context)},
        ),
  };
}
