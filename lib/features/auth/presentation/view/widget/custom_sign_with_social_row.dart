import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/imageassets.dart';

class CutomSignWithSocialRow extends StatelessWidget {
  const CutomSignWithSocialRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Center(
            child: Image.asset(
              AppImageAsset.imagesAppleLogo,
              height: 56.h,
              width: 56.w,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Center(
            child: Image.asset(
              AppImageAsset.imagesGoogleLogo,
              height: 25.h,
              width: 25.w,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Center(
            child: Image.asset(
              AppImageAsset.imagesFacebookLogo,
              height: 30.h,
              width: 30.w,
            ),
          ),
        ),
      ],
    );
  }
}
