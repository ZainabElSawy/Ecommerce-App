import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

class CustomOnBoardingContant extends StatelessWidget {
  const CustomOnBoardingContant({
    super.key,
    required this.body,
  });

  final String body;

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: "normal",
        height: 1.5,
        color: AppColor.grey,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}