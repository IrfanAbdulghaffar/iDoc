//we will be listing the constants here that we are using in app

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_constants.dart';

class AppConstants {
  //app title
  static const appName = 'iDoc';
  Color textColor=ColorConstants.primary;

// styles
  //Heading 1
  static TextStyle heading1 = GoogleFonts.montserrat(
    textStyle:const TextStyle(
      fontSize: 18,
    ),
  );

  static TextStyle heading1Bold = const TextStyle(
    fontFamily: "montserrat",
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  //Heading 2
  static TextStyle heading2 =  GoogleFonts.montserrat(
    textStyle:const TextStyle(
      fontSize: 14,
    ),
  );
  //Heading 1
  static TextStyle heading3 = const TextStyle(
    fontFamily: "montserrat",
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static TextStyle heading1_with_gray_color = const TextStyle(
    fontFamily: "montserrat",
    fontSize: 13,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );

  static const phoneNumber = 'phoneNumber';
  static const userId = 'userId';
  static const loginToken = 'loginToken';
  static const isLoggedIn = 'isLoggedIn';
  static const userName = 'userName';
  static const profileImage = "profileImage";
}

