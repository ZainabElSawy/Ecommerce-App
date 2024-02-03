import 'dart:io';

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

alertExitApp(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).alert),
        content: Text(S.of(context).doyouwanttoexitfromthisapp),
        actions: [
          ElevatedButton(
            onPressed: () => exit(0),
            child: Text(S.of(context).confirm),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
        ],
      );
    },
  );
  return false;
}
