import '../../main.dart';

translateDatabase(columnar, columnen) {
  if (sharedPreferences?.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
