import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:supreme_kai_world/game.dart';
import 'package:supreme_kai_world/actor/actor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supreme Kai World',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFF6600)),
        useMaterial3: true,
      ),
      home: Game(),
    );
  }
}
