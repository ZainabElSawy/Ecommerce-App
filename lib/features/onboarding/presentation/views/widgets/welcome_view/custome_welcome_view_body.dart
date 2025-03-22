import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/styles.dart';

class CustomWelcomeViewBody extends StatelessWidget {
  const CustomWelcomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        "Discover the latest trends, express yourself, and redefine fashion your way. Join us!",
        style: Styles.textStyleRegular14,
        textAlign: TextAlign.center,
      ),
    );
  }
}
