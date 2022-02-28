import 'package:flutter/material.dart';

class AssetColor {
  static const Color backColorDark = Color(0xff505c52);
  static const Color backColorLight = Color(0xff6b7b6e);

  static const Color textColorBtn = Color(0xffdeffe4);
  static const Color textColorLight = Color(0xffb1ccb6);
}

class AssetStyle {
  static TextStyle textStyle(Color color, double size) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none);
  }

  static late TextStyle textStyle1 = textStyle(AssetColor.textColorLight, 12);
  static late TextStyle textStyle2 = textStyle(AssetColor.textColorLight, 16);

  static late TextStyle textStyleBtn1 = const TextStyle(
      color: AssetColor.textColorBtn,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);
}
