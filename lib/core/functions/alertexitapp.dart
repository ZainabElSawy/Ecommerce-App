import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

Future<bool> alertExitApp(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          S.of(context).alert,
          style: const TextStyle(
            color: AppColor.primarycolor,
            fontWeight: FontWeight.bold,
          ),
        )),
        content: Text(S.of(context).doyouwanttoexitfromthisapp),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(AppColor.white),
              side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(
                  color: AppColor.primarycolor,
                  width: 2,
                ),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).cancel,
              style: const TextStyle(color: AppColor.primarycolor),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(AppColor.thirdcolor),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).confirm,
              style: const TextStyle(color: AppColor.primarycolor),
            ),
          ),
        ],
      );
    },
  );
  return false;
}
