import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

class ResendCounter extends StatelessWidget {
  final String counter;
  final bool enabled;
  const ResendCounter({
    Key? key,
    required this.counter,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: const Color(0xFFF1F1F1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(
          counter,
          style: TextStyle(
            color: enabled == true ? AppColor.primarycolor : AppColor.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
