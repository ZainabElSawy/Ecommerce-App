import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'show_snack_bar.dart';

requestPerLocation(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // ignore: use_build_context_synchronously
    return showSnackBar(context, msg: "Please enable location service!");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // ignore: use_build_context_synchronously
      return showSnackBar(context,
          msg: "Please give location permission to the application!");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // ignore: use_build_context_synchronously
    return showSnackBar(context,
        msg:
            "Location permissions are permanently denied, we cannot request permissions!");
  }
  // return await Geolocator.getCurrentPosition();
}