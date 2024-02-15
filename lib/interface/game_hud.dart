import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:supreme_kai_world/interface/sword_component.dart';
import 'package:supreme_kai_world/interface/menu_component.dart';

class GameHud extends GameInterface {
  late Sprite item;

  @override
  Future<void> onLoad() async {
    add(SwordComponent());
    add(MenuComponent());
    return super.onLoad();
  }
}
