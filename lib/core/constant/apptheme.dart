import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primarycolor,
      foregroundColor: AppColor.white,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primarycolor),
      titleTextStyle: TextStyle(
        color: AppColor.primarycolor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "PlayfairDisplay",
      ),
      foregroundColor: Colors.white,
    ),
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primarycolor,
      foregroundColor: AppColor.white,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primarycolor),
      titleTextStyle: TextStyle(
        color: AppColor.primarycolor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "Cairo",
      ),
      foregroundColor: Colors.white,
    ),
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
