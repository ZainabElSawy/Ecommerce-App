import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CardDeliveryType extends StatelessWidget {
  const CardDeliveryType({
    super.key,
    required this.image,
    required this.title,
    required this.isActive,
  });
  final String image;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.secondarycolor),
        color: isActive ? AppColor.secondarycolor : Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 75,
            color: isActive ? AppColor.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? AppColor.white : AppColor.secondarycolor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
