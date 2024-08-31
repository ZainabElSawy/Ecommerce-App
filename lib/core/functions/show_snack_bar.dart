import 'package:flutter/material.dart';

showSnackBar(BuildContext context, {required String msg}) {
  final snackBar = SnackBar(
    content: Text(msg),
    // action: SnackBarAction(
    //   label: 'Undo',
    //   onPressed: () {},
    // ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
