import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_theme.dart';
import 'package:supreme_kai_world/screens/actor_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supreme Kai World',
      theme: gameTheme,
      home: ActorSelection(),
    );
  }
}
