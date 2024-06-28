import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class NotificationWidget extends StatelessWidget {
  final void Function()? onNotificationPressed;
  const NotificationWidget({
    Key? key,
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onNotificationPressed,
        icon: const Icon(
          size: 30,
          Icons.notifications_active_outlined,
          color: AppColor.grey,
        ),
      ),
    );
  }
}