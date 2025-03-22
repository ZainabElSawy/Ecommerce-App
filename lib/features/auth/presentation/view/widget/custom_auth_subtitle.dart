import 'package:ecommerce_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

class CustomAuthSubTitle extends StatelessWidget {
  const CustomAuthSubTitle({
    super.key,
    required this.subTitle,
  });
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: Styles.textStyleRegular12.copyWith(color: AppColor.darkGrey),
    );
  }
}
