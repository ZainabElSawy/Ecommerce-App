import 'package:hive_flutter/hive_flutter.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/home/data/models/categories_model.dart';
import '../../features/home/data/models/item_model.dart';
import 'constants.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CategoriesModelAdapter());
  Hive.registerAdapter(ItemModelAdapter());
  await Hive.openBox<User>(kUser);
  await Hive.openBox<CategoriesModel>(kCategories);
  await Hive.openBox<ItemModel>(kItems);
}
