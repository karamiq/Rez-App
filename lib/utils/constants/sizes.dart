import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconSize {
  const IconSize._();

  static const double extraSmall = 8.0;
  static const double small = 16.0;
  static const double medium = 24.0;
  static const double large = 32.0;
  static const double extraLarge = 48.0;
}

class FontsTheme {
  static const bigWeight = FontWeight.w700;
  static const mediumBigWeight = FontWeight.w600;
  static const mediumWeight = FontWeight.w500;
  static const normalWeight = FontWeight.w400;

  static const double veryBigSize = 32;
  static const double mediumVeryBigSize = 28;
  static const double bigSize = 24;
  static const double mediumBigSize = 20;
  static const double mediumSize = 16;
  static const double normalSize = 14;
  static const double smallSize = 12;
  static const double verySmallSize = 10;
}

class ColorsTheme {
  static const onBackground = Color(0xFF1E1B34);
  static const backGround = Color(0xFF020316);
  static const border = Color(0xFF5D2775);
  static const lightBorder = Color(0xFF8A87FF);
  static const primary = Color(0xFFE85EFF);
  static const secondary = Color(0xFF6E1B93);
  static const primaryContainer = Color(0xFF14161F);
  static const divider = Color(0xFF1D1E2D);
  static const listTileBackground = Color(0xFF060212);
  static const indego = Color(0xFF484B7B);
  static const darkIndego = Color(0xFF171954);
  static const hint = Color(0xFF828282);
  static const cardColor = Color(0xFF272841);
  static const cyan = Color(0xFFC8EFF8);
  static const onCard = Color(0xFF63658D);
  static const subtitle = Color(0xFFB3B8B8);
  static const soldSeat = Color(0xFFB6116B);
  static const idkSeat = Color(0xFF09FBD3);
  static const bookingSeat = Color(0xFF00E525);
  static LinearGradient primaryLinearGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        lightBorder,
        Color(0xFFE85EFF),
        Color(0xFF561976),
      ]);

  static SweepGradient dark = const SweepGradient(
      center: Alignment.center,
      tileMode: TileMode.mirror,
      colors: [
        lightBorder,
        Color.fromARGB(255, 72, 72, 72),
        Color.fromARGB(255, 72, 72, 72),
      ]);
}

class BorderSize {
  const BorderSize._();

  static const double none = 0;
  static const double xxs = 4.0;
  static const double extraSmall = 8.0;
  static const double small = 16.0;
  static const double medium = 24.0;
  static const double large = 32.0;
  static const double extraLarge = 48.0;
  static const double full = 100.0;

  static const BorderRadius noneRadius =
      BorderRadius.all(Radius.circular(none));
  static const BorderRadius xxsRadius = BorderRadius.all(Radius.circular(xxs));
  static const BorderRadius extraSmallRadius =
      BorderRadius.all(Radius.circular(extraSmall));
  static const BorderRadius smallRadius =
      BorderRadius.all(Radius.circular(small));
  static const BorderRadius mediumRadius =
      BorderRadius.all(Radius.circular(medium));
  static const BorderRadius largeRadius =
      BorderRadius.all(Radius.circular(large));
  static const BorderRadius extraLargeRadius =
      BorderRadius.all(Radius.circular(extraLarge));
  static const BorderRadius fullRadius =
      BorderRadius.all(Radius.circular(full));
}

class Insets {
  const Insets._();

  static const double none = 0.0;
  static const double extraSmall = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;

  static const EdgeInsets noneAll = EdgeInsets.all(none);
  static const EdgeInsets extraSmallAll = EdgeInsets.all(extraSmall);
  static const EdgeInsets smallAll = EdgeInsets.all(small);
  static const EdgeInsets mediumAll = EdgeInsets.all(medium);
  static const EdgeInsets largeAll = EdgeInsets.all(large);
  static const EdgeInsets extraLargeAll = EdgeInsets.all(extraLarge);
}

class BorderWidth {
  const BorderWidth._();

  static const double none = 0.0;
  static const double extraSmall = 1.0;
  static const double small = 2.0;
  static const double medium = 4.0;
  static const double large = 8.0;
  static const double extraLarge = 16.0;
}

class Time {
  const Time._();

  static const Duration none = Duration.zero;
  static const Duration extraSmall = Duration(milliseconds: 100);
  static const Duration small = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 500);
  static const Duration large = Duration(milliseconds: 700);
  static const Duration extraLarge = Duration(seconds: 1);
}
