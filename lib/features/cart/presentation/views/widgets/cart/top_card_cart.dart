import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  const TopCardCart({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 33,
      decoration: BoxDecoration(
        color: AppColor.thirdcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.secondarycolor),
      ),
    );
  }
}
