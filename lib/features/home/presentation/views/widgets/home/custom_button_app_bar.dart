import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  final bool active;
  const CustomButtonAppBar({
    Key? key,
    this.onPressed,
    required this.text,
    required this.icon,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.primarycolor : AppColor.darkGrey,
            size: 28,
          ),
          // Text(
          //   text,
          //   style: TextStyle(
          //       color: active == true ? AppColor.primarycolor : AppColor.darkGrey),
          // ),
        ],
      ),
    );
  }
}
