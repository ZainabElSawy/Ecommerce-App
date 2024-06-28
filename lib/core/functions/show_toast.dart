import 'package:fluttertoast/fluttertoast.dart';

import '../constant/color.dart';

Future<bool?> showToastWidget({required String msg}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColor.grey.withOpacity(0.5),
    textColor: AppColor.black,
    fontSize: 16.0,
  );
}
