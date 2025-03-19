import 'package:flutter/material.dart';

import '../../../../../../core/constant/styles.dart';

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
      style: Styles.textStyleRegular14,
      textAlign: TextAlign.center,
    );
  }
}
