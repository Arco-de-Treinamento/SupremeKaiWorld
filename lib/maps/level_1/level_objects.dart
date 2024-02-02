import 'package:flutter/material.dart';
import 'package:bonfire/tiled/builder/tiled_world_builder.dart';
import 'package:supreme_kai_world/decoration/info_decoration.dart';
import 'package:supreme_kai_world/decoration/statue_nav_decoration.dart';

Map<String, ObjectBuilder> levelObjects(BuildContext context) {
  return {
    'frog_statue': (p) => StatueNavigationDecoration(
          'decorations/frog_statue.png',
          decorationPosition: p.position,
          navigationAction: () => {Navigator.pop(context)},
        ),
    'monk_statue': (p) => StatueNavigationDecoration(
          'decorations/monk_statue.png',
          decorationPosition: p.position,
          navigationAction: () => {Navigator.pop(context)},
        ),
    'warrior_statue': (p) => StatueNavigationDecoration(
          'decorations/warrior_statue.png',
          decorationPosition: p.position,
          navigationAction: () => {Navigator.pop(context)},
        ),
    'warrior_info': (p) => InfoDecoration(
          'warrior info placa',
          decorationPosition: p.position,
        ),
    'monk_info': (p) => InfoDecoration(
          'monk info placa',
          decorationPosition: p.position,
        ),
    'frog_info': (p) => InfoDecoration(
          'frog info placa',
          decorationPosition: p.position,
        ),
  };
}
