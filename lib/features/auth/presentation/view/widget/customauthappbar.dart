import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAuthAppBar({
    required this.title,
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColor.backgroundcolor,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColor.grey),
      ),
    );
  }
}
