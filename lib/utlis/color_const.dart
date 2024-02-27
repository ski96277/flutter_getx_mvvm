import 'package:flutter/material.dart';

class ColorConst {
  static Color BLUE_COLOR = colorFromHex('#002C6C');
  static Color APP_LOGO_COLOR = colorFromHex('#FF275A');
  static const Color WHITE_COLOR = Colors.white;
  static const Color BLACK_COLOR = Colors.black;
  static const Color LIGHT_BLACK_COLOR = Colors.black45;
  static const Color BLUE_GREY_COLOR = Colors.blueGrey;

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
