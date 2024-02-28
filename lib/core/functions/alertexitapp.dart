import 'dart:io';

import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

Future<bool> alertExitApp(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(S.of(context).alert),
        content: Text(S.of(context).doyouwanttoexitfromthisapp),
        actions: [
          TextButton(
            onPressed: () => exit(0),
            child: Text(
              S.of(context).confirm,
              style: const TextStyle(color: AppColor.primarycolor),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColor.primarycolor),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).cancel,
              style: const TextStyle(color: AppColor.backgroundcolor),
            ),
          ),
        ],
      );
    },
  );
  return false;
}
