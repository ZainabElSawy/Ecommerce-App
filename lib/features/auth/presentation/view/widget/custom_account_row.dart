import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/styles.dart';

class CustomAccountRow extends StatelessWidget {
  const CustomAccountRow({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Styles.textStyleRegular12,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
              decorationColor: AppColor.brownPrimaryColor,
              color: AppColor.brownPrimaryColor,
              decoration: TextDecoration.underline,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
