import 'package:flutter/material.dart';

class AssetColor {
  static const Color backColorDark = Color(0xff505c52);
  static const Color backColorLight = Color(0xff6b7b6e);

  static const Color textColorBtn = Color(0xffdeffe4);
  static const Color textColorLight = Color(0xffb1ccb6);
  static const Color textColorDark = Color(0xff2C332E);
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

  static late TextStyle textStyle1 = const TextStyle(
      color: AssetColor.textColorLight,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);

  static late TextStyle textStyle2 = const TextStyle(
      color: AssetColor.textColorLight,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);

  static late TextStyle textStyleBtn1 = const TextStyle(
      color: AssetColor.textColorBtn,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);

  static late TextStyle textStyleInput1 = const TextStyle(
      color: AssetColor.textColorBtn,
      fontSize: 12,
      // fontWeight: FontWeight.bold,
      // height: 2,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);

  static late TextStyle textStyleMsg1 = const TextStyle(
      color: AssetColor.textColorDark,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      // height: 2,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);

  static late TextStyle textStyleMsg2 = const TextStyle(
      color: AssetColor.textColorLight,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      // height: 2,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);
}
