import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../../core/constant/color.dart';

class NotificationCustomListTile extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  const NotificationCustomListTile({
    Key? key,
    required this.title,
    required this.body,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(body),
          ),
          Positioned(
            //top: 10,
            right: 5,
            child: Text(
              Jiffy.parse(date, pattern: "yyyy-MM-dd HH:mm:ss").fromNow(),
              style: const TextStyle(
                color: AppColor.primarycolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
