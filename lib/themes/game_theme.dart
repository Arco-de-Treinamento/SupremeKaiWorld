import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';

/// O ThemeData [gameTheme] define o tema do jogo com base no [GamePalette].

ThemeData gameTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: GamePalette.primary,
    onPrimary: GamePalette.onPrimary,
    secondary: GamePalette.secondary,
    onSecondary: GamePalette.onSecondary,
    error: GamePalette.error,
    onError: GamePalette.onError,
    background: GamePalette.background,
    onBackground: GamePalette.onBackground,
    surface: GamePalette.surface,
    onSurface: GamePalette.onSurface,
  ),
);
