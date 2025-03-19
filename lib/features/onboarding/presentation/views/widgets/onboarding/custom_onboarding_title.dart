import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/styles.dart';

class CustomOnBoardingTitle extends StatelessWidget {
  const CustomOnBoardingTitle({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: index == 0
            ? TextSpan(
                text: "Seamless ",
                style: Styles.textStyleBold23.copyWith(
                  color: AppColor.brownPrimaryColor,
                ),
                children: [
                  TextSpan(
                    text: "Shopping Experience",
                    style: Styles.textStyleBold23,
                  ),
                ],
              )
            : index == 1
                ? TextSpan(
                    text: "Wishlist: Where  ",
                    style: Styles.textStyleBold23,
                    children: [
                      TextSpan(
                        text: "Fashion Dreams ",
                        style: Styles.textStyleBold23.copyWith(
                          color: AppColor.brownPrimaryColor,
                        ), // TextStyle(
                      ),
                      TextSpan(
                        text: "Begin",
                        style: Styles.textStyleBold23,
                      ),
                    ],
                  )
                : TextSpan(
                    text: "Swift  ",
                    style: Styles.textStyleBold23.copyWith(
                      color: AppColor.brownPrimaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: "and ",
                        style: Styles.textStyleBold23, // TextStyle(
                      ),
                      TextSpan(
                        text: "Reliable ",
                        style: Styles.textStyleBold23.copyWith(
                          color: AppColor.brownPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: "Delivery",
                        style: Styles.textStyleBold23,
                      ),
                    ],
                  ),
      ),
    );
  }
}
