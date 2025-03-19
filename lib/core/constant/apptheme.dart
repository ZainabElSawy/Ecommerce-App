import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: GoogleFonts.inter().fontFamily,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.black,
      foregroundColor: AppColor.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.brownPrimaryColor),
      titleTextStyle: TextStyle(
        color: AppColor.brownPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontWeight: FontWeight.w800, fontSize: 22.sp, color: AppColor.black),
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w900, fontSize: 26.sp, color: AppColor.black),
      bodyLarge: TextStyle(
          //fontFamily: "normal",
          height: 1.5,
          color: AppColor.grey,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        //fontFamily: "normal",
        height: 1.5,
        color: AppColor.grey,
        fontSize: 15.sp,
      ),
    ));
ThemeData themeArabic = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: "Cairo",
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.brownPrimaryColor,
      foregroundColor: AppColor.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.brownPrimaryColor),
      titleTextStyle: TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
        fontFamily: "Cairo",
      ),
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontWeight: FontWeight.w800, fontSize: 22.sp, color: AppColor.black),
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w900, fontSize: 26.sp, color: AppColor.black),
      bodyLarge: TextStyle(
          //fontFamily: "normal",
          height: 1.5,
          color: AppColor.grey,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
        //fontFamily: "normal",
        height: 1.5,
        color: AppColor.grey,
        fontSize: 15.sp,
      ),
    ));
