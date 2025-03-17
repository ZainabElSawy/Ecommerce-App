import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../../main.dart';


class NotificationController {

  static Future<void> initializeLocalNotifications() async {

    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'alerts',
          channelName: 'Alerts',
          channelDescription: 'Notification tests as alerts',
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.High,
          defaultPrivacy: NotificationPrivacy.Private,
          defaultColor: Colors.deepPurple,
          ledColor: Colors.deepPurple,
        )
      ],
      debug: true,
    );
  }

  static ReceivePort? receivePort;

  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
          (silentData) => onActionReceivedImplementationMethod(silentData));
    IsolateNameServer.registerPortWithName(
        receivePort!.sendPort, 'notification_action_port');
  }

  // static Future<void> startListeningNotificationEvents() async {
  //   AwesomeNotifications()
  //       .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  // }

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      //log('Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      await executeLongTaskInBackground();
    } else {
      if (receivePort == null) {
        SendPort? sendPort =
            IsolateNameServer.lookupPortByName('notification_action_port');
        if (sendPort != null) {
          sendPort.send(receivedAction);
          return;
        }
      }
      return onActionReceivedImplementationMethod(receivedAction);
    }
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    // MyApp.navigatorKey.currentState?.push(
    //     MaterialPageRoute(builder: (context) => const NotificationPage()));
  }

  static Future<bool> displayNotificationRationale(BuildContext context) async {
    bool userAuthorized = false;
    await showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('Get Notified!',
              style: Theme.of(context).textTheme.titleLarge),
          content: const Text(
              'Allow Awesome Notifications to send you beautiful notifications!'),
          actions: [
            TextButton(
              onPressed: () {
                prefs?.setString('hasDeniedNotifications', "1");
                //log("${ prefs?.getString('hasDeniedNotifications')}");
                Navigator.of(ctx).pop();
              },
              child: Text('Deny',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                prefs?.setString('hasDeniedNotifications', "0");
                //log("${ prefs?.getString('hasDeniedNotifications')}");

                userAuthorized = true;
                Navigator.of(ctx).pop();
              },
              child: Text('Allow',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.deepPurple)),
            ),
          ],
        );
      },
    );
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  static Future<void> executeLongTaskInBackground() async {
    //log("starting long task");
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse("http://google.com");
    // ignore: unused_local_variable
    final re = await http.get(url);
    //log(re.body);
    //log("long task done");
  }

  static Future<void> createNewNotification(
      {required String title, required String msg}) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    String? isDeny = prefs?.getString('hasDeniedNotifications');
    //log("$isDeny");
    if (!isAllowed) {
      isAllowed = await displayNotificationRationale(
          MyApp.navigatorKey.currentContext!);
    }

    if (isDeny == "0") {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: -1,
          channelKey: 'alerts',
          title: title,
          body: msg,
        ),
      );
    }
  }
}
