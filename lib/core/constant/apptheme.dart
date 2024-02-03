import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontWeight: FontWeight.w800, fontSize: 22, color: AppColor.black),
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w900, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          //fontFamily: "normal",
          height: 1.5,
          color: AppColor.grey,
          fontSize: 15,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        //fontFamily: "normal",
        height: 1.5,
        color: AppColor.grey,
        fontSize: 15,
      ),
    ));
ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontWeight: FontWeight.w800, fontSize: 22, color: AppColor.black),
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w900, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          //fontFamily: "normal",
          height: 1.5,
          color: AppColor.grey,
          fontSize: 15,
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
        //fontFamily: "normal",
        height: 1.5,
        color: AppColor.grey,
        fontSize: 15,
      ),
    ));
