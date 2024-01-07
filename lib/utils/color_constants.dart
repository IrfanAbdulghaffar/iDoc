// app color constants

import 'package:flutter/material.dart';

import 'extensions.dart';
import 'helper_functions.dart';

class ColorConstants {
  //basics color
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  //App theme colors
  static Color primary = CustomColor.fromHex("#862996");
  static Color secondary = CustomColor.fromHex("#00C3D7");

  static Color APP_TEXT_BLUE = CustomColor.fromHex("#5f89bc");
  static Color DEFAULT_TEXT_COLOR = CustomColor.fromHex("#808080");

  // static Color hexToColor(String? code) {
  //   print(int.parse(code!.substring(1, 7), radix: 16) + 0xFF000000);
  //   return new Color(int.parse(code!.substring(1, 7), radix: 16) + 0xFF000000);
  // }




  //Extra's
  static const grey = Colors.grey;
  static const blue = Colors.blue;
  static const green = Colors.green;
  static const red = Colors.red;
  static const orange = Colors.orange;
  static const yellow = Colors.yellow;
  static const brown = Colors.brown;

  //TextField Color
  static const inputColor = Colors.white;
  static const drawerTextColor = Colors.black;
  static const transparent = Colors.transparent;
  static const buttonSky = Color(0xFF54c1ef);
  static const skyDark = Color.fromARGB(255, 125, 189, 225);
  static const sky = Color.fromARGB(255, 224, 244, 255);
  static const greyTextDark = Color(0xFF8d8d8d);
  static Color buttonBlue = secondary;
  static const feedbackContainerColor = Color(0xFFEAEAEA);
}
