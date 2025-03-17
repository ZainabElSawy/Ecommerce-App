import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/orders/presentation/manager/order_cubit/pending_orders_cubit.dart';
import '../../main.dart';
import '../services/notification_services.dart';

requestPermissionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // ignore: unused_local_variable
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  // print('User granted permission: ${settings.authorizationStatus}');
}

Future<void> checkNotificationPermission(BuildContext context) async {
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  String? isDeny = prefs?.getString('hasDeniedNotifications');
  if (isAllowed && (isDeny == null)) {
    // ignore: use_build_context_synchronously
    await NotificationController.displayNotificationRationale(context);
  }
}

fcmConfig(BuildContext context) {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("=========== Notification ===========");
    log("${message.notification?.title}");
    log("${message.notification?.body}");

    // ignore: use_build_context_synchronously
    String route = GoRouter.of(context).location;
    // ignore: use_build_context_synchronously
    refreshPageNotification(message.data, route, context);
    NotificationController.createNewNotification(
      title: "${message.notification?.title}",
      msg: "${message.notification?.body}",
    );
  });
}

refreshPageNotification(data, route, context) {
  log(route);
  if (data["pagename"] == "refreshorderpending" && route == "/pending") {
    log("refreshorderpending");
    BlocProvider.of<OrdersCubit>(context).fetchPendingOrders();
  }
}
