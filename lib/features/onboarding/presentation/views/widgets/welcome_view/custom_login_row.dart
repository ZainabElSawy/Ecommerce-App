import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../../../../core/constant/styles.dart';

class CustomLoginRow extends StatelessWidget {
  const CustomLoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: Styles.textStyleRegular15,
        ),
        InkWell(
          onTap: () {
            context.pushPage(route: AppRouter.login);
          },
          child: Text(
            "Sign In",
            style: TextStyle(
              decorationColor: AppColor.brownPrimaryColor,
              color: AppColor.brownPrimaryColor,
              decoration: TextDecoration.underline,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
