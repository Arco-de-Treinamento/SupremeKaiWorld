import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:supreme_kai_world/interface/sword_component.dart';

class GameHud extends GameInterface {
  late Sprite item;

  @override
  Future<void> onLoad() async {
    add(SwordComponent());
    return super.onLoad();
  }
}
