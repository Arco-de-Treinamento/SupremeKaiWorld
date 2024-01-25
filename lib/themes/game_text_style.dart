import 'package:flutter/material.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';

class _TitleLargeStyle {
  TextStyle get primary => TextStyle(
        fontSize: 28.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 28.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary,
        fontWeight: FontWeight.w500,
      );
}

class _TitleMediumStyle {
  TextStyle get primary => TextStyle(
        fontSize: 24.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 24.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary,
        fontWeight: FontWeight.w500,
      );
}

class _TitleSmallStyle {
  TextStyle get primary => TextStyle(
        fontSize: 20.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 20.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary,
        fontWeight: FontWeight.w500,
      );
}

class _BodyTextLargeStyle {
  TextStyle get primary => TextStyle(
        fontSize: 22.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary.withOpacity(0.7),
        fontWeight: FontWeight.w300,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 22.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary.withOpacity(0.7),
        fontWeight: FontWeight.w300,
      );
}

class _BodyTextMediumStyle {
  TextStyle get primary => TextStyle(
        fontSize: 18.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary.withOpacity(0.7),
        fontWeight: FontWeight.w300,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 18.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary.withOpacity(0.7),
        fontWeight: FontWeight.w300,
      );
}

class _BodyTextSmallStyle {
  TextStyle get primary => TextStyle(
        fontSize: 14.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary.withOpacity(0.7),
        fontWeight: FontWeight.w300,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 14.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary.withOpacity(0.7),
        fontWeight: FontWeight.w300,
      );
}

class _ButtonLargeStyle {
  TextStyle get primary => TextStyle(
        fontSize: 28.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary,
        fontWeight: FontWeight.w600,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 28.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary,
        fontWeight: FontWeight.w600,
      );
}

class _ButtonMediumStyle {
  TextStyle get primary => TextStyle(
        fontSize: 20.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary,
        fontWeight: FontWeight.w600,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 20.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary,
        fontWeight: FontWeight.w600,
      );
}

class _ButtonSmallStyle {
  TextStyle get primary => TextStyle(
        fontSize: 14.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textPrimary,
        fontWeight: FontWeight.w600,
      );

  TextStyle get secondary => TextStyle(
        fontSize: 14.0,
        fontFamily: 'PixelifySans',
        color: GamePalette.textSecondary,
        fontWeight: FontWeight.w600,
      );
}

/// A classe [GameTextStyle] define todas as fontes do game seguindo a [GamePalette] e utilizando a fonte 'PixelifySans'.
class GameTextStyle {
  static _TitleLargeStyle titleLarge = _TitleLargeStyle();
  static _TitleMediumStyle titleMedium = _TitleMediumStyle();
  static _TitleSmallStyle titleSmall = _TitleSmallStyle();

  static _BodyTextLargeStyle bodyTextLarge = _BodyTextLargeStyle();
  static _BodyTextMediumStyle bodyTextMedium = _BodyTextMediumStyle();
  static _BodyTextSmallStyle bodyTextSmall = _BodyTextSmallStyle();

  static _ButtonLargeStyle buttonLarge = _ButtonLargeStyle();
  static _ButtonMediumStyle buttonMedium = _ButtonMediumStyle();
  static _ButtonSmallStyle buttonSmall = _ButtonSmallStyle();
}
