import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../data/models/notification_model.dart';
import 'notification_custom_listtile.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.notifications});
  final List<NotificationsModel> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            'Notification',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColor.primarycolor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ...List.generate(
            notifications.length,
            (index) => NotificationCustomListTile(
                  title: notifications[index].notificationTitle ?? "",
                  body: notifications[index].notificationBody ?? "",
                  date: notifications[index].notificationDatetime ?? "",
                )),
      ],
    );
  }
}
