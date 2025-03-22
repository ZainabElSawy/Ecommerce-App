import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static late TextStyle textStyle10;
  static late TextStyle textStyleRegular12;
  static late TextStyle textStyleRegular14;
  static late TextStyle textStyleRegular15;
  static late TextStyle textStyle16;
  static late TextStyle textStyle18;
  static late TextStyle textStyle20;
  static late TextStyle textStyleBold22;
  static late TextStyle textStyleBold23;
  static late TextStyle textStyle30;
  static late TextStyle textStyleUnderLine;
  static void init() {
    textStyleUnderLine = TextStyle(
      decorationColor: AppColor.brownPrimaryColor,
      color: AppColor.brownPrimaryColor,
      decoration: TextDecoration.underline,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
    );
    textStyleRegular12 = TextStyle(
      color: AppColor.black,
      fontSize: 12.sp,
      fontFamily: GoogleFonts.inter().fontFamily,
    );
    textStyleRegular14 = TextStyle(
      color: AppColor.darkGreyColor,
      fontSize: 14.sp,
      fontFamily: GoogleFonts.inter().fontFamily,
    );
    textStyleRegular15 = TextStyle(
      color: AppColor.blackColor,
      fontSize: 15.sp,
      fontFamily: GoogleFonts.inter().fontFamily,
    );
    textStyleBold22 = TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.blackColor,
      fontFamily: GoogleFonts.inter(fontWeight: FontWeight.bold).fontFamily,
    );
    textStyleBold23 = TextStyle(
      fontSize: 23.sp,
      color: AppColor.blackColor,
      fontFamily: GoogleFonts.inter(fontWeight: FontWeight.bold).fontFamily,
    );
    // textStyle12 = TextStyle(
    //   fontSize: 12.sp,
    //   color: AppColors.primaryColor,
    //   fontFamily: 'Poppins',
    //   fontWeight: FontWeight.w600,
    // );
    // textStyle14 = TextStyle(
    //   fontSize: 14.sp,
    //   color: AppColors.primaryColor,
    //   fontFamily: 'Poppins',
    //   fontWeight: FontWeight.w400,
    // );
    // textStyle16 = TextStyle(
    //   fontSize: 16.sp,
    //   fontWeight: FontWeight.w600,
    //   color: AppColors.primaryColor,
    //   fontFamily: 'Poppins',
    // );
    // textStyle18 = TextStyle(
    //   fontSize: 18.sp,
    //   fontWeight: FontWeight.w600,
    // );
    // textStyle20 = TextStyle(
    //   fontSize: 20.sp,
    //   color: AppColors.primaryColor,
    //   fontFamily: 'Poppins',
    //   fontWeight: FontWeight.w700,
    //   height: 1.50.h,
    // );
    // textStyle24 = TextStyle(
    //   color: Color(0xFF061023),
    //   fontSize: 24.sp,
    //   fontFamily: 'Inter',
    //   fontWeight: FontWeight.w600,
    // );
    // textStyle30 = TextStyle(
    //   fontSize: 30,
    //   fontWeight: FontWeight.w500,
    //   // fontFamily: kGtSectraFine,
    // );
  }
}
