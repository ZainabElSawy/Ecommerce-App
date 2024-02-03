import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "cannotbeembty".tr;
  }
  if (val.length < min) {
    return "${"cannotbelessthan".tr} $min";
  }
  if (val.length > max) {
    return "${"cannotbelargerthan".tr} $max";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "notvalidusername".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "notvalidemail".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone number".tr;
    }
  }
}
