import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/styles.dart';

class CustomWelconViewTitle extends StatelessWidget {
  const CustomWelconViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "The ",
          style: Styles.textStyleBold23,
          children: [
            TextSpan(
              text: "Fashion App ",
              style: Styles.textStyleBold23.copyWith(
                color: AppColor.brownPrimaryColor,
              ), // TextStyle(
            ),
            TextSpan(
              text: "That Makes you Look Your Best",
              style: Styles.textStyleBold23,
            ),
          ],
        ),
      ),
    );
  }
}
