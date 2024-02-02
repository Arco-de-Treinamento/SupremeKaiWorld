import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';

class _GameTextStyle {
  final TextStyle _baseStyle;
  final double _opacity;

  const _GameTextStyle(this._baseStyle, {double opacity = 1.0})
      : _opacity = opacity;

  TextStyle get primary =>
      _baseStyle.copyWith(color: GamePalette.textPrimary.withOpacity(_opacity));
  TextStyle get secondary => 
      _baseStyle.copyWith(color: GamePalette.textSecondary.withOpacity(_opacity));
}

/// A classe [GameTextStyle] define todas as fontes do game seguindo a [GamePalette] e utilizando a fonte 'PixelifySans'.
class GameTextStyle {
  static TextStyle _baseStyle(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      TextStyle(
        fontSize: fontSize,
        fontFamily: 'PixelifySans',
        color: color,
        fontWeight: fontWeight,
      );

  static final _GameTextStyle titleLarge =
      _GameTextStyle(_baseStyle(fontSize: 28.0, fontWeight: FontWeight.w500));
  static final _GameTextStyle titleMedium =
      _GameTextStyle(_baseStyle(fontSize: 24.0, fontWeight: FontWeight.w500));
  static final _GameTextStyle titleSmall =
      _GameTextStyle(_baseStyle(fontSize: 20.0, fontWeight: FontWeight.w500));

  static final _GameTextStyle bodyTextLarge = _GameTextStyle(
      _baseStyle(fontSize: 22.0, fontWeight: FontWeight.w300), opacity: 0.7);
  static final _GameTextStyle bodyTextMedium = _GameTextStyle(
      _baseStyle(fontSize: 18.0, fontWeight: FontWeight.w300), opacity: 0.7);
  static final _GameTextStyle bodyTextSmall = _GameTextStyle(
      _baseStyle(fontSize: 14.0, fontWeight: FontWeight.w300), opacity: 0.7);

  static final _GameTextStyle buttonLarge =
      _GameTextStyle(_baseStyle(fontSize: 28.0, fontWeight: FontWeight.w600));
  static final _GameTextStyle buttonMedium =
      _GameTextStyle(_baseStyle(fontSize: 20.0, fontWeight: FontWeight.w600));
  static final _GameTextStyle buttonSmall =
      _GameTextStyle(_baseStyle(fontSize: 14.0, fontWeight: FontWeight.w600));
}
