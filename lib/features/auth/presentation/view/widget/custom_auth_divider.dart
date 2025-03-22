import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/styles.dart';

class CustomAuthDivider extends StatelessWidget {
  const CustomAuthDivider({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 36.w),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 0.5.h,
              color: Colors.grey.shade400,
              thickness: 0.8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              text,
              style:
                  Styles.textStyleRegular12.copyWith(color: AppColor.darkGrey),
            ),
          ),
          Expanded(
            child: Divider(
              height: 0.5.h,
              color: Colors.grey.shade400,
              thickness: 0.8.h,
            ),
          ),
        ],
      ),
    );
  }
}
