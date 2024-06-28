import 'package:flutter/material.dart';

import '../../main.dart';
import '../constant/color.dart';
import '../constant/routes.dart';

alertLogOut(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
        titlePadding: EdgeInsets.zero,
        title: Container(
          decoration: const BoxDecoration(
            color: AppColor.primarycolor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(28),
              topLeft: Radius.circular(28),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.exit_to_app_sharp, size: 30, color: Colors.white),
              Text(
                "LogOut",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                "Are you sure you want to Logout?",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primarycolor,
              textStyle: const TextStyle(fontSize: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            onPressed: () {
              sharedPreferences?.remove("userid");
              // ignore: use_build_context_synchronously
              context.pushReplacePage(route: AppRouter.login);
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: AppColor.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: AppColor.primarycolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
