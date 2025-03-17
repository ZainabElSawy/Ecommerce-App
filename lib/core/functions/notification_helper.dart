import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

Future<void> getToken() async {
  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    log("***********************");
    log("$token");
    log("***********************");
  });
}

Future<void> getAccessToken() async {
  String? accessToken;

  try {
    final serviceAccountJson = await rootBundle.loadString(
        'assets/ecommerce-69b4a-firebase-adminsdk-nommo-223b9e3fc2.json');

    final accountCredentials = ServiceAccountCredentials.fromJson(
      json.decode(serviceAccountJson),
    );

    const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    final client = http.Client();
    try {
      final accessCredentials = await obtainAccessCredentialsViaServiceAccount(
        accountCredentials,
        scopes,
        client,
      );

      accessToken = accessCredentials.accessToken.data;

      // ignore: avoid_print
      print('Access Token: $accessToken');
    } catch (e) {
      // ignore: avoid_print
      print('Error obtaining access token: $e');
    } finally {
      client.close();
    }
  } catch (e) {
    // ignore: avoid_print
    print('Error loading service account JSON: $e');
  }
}
