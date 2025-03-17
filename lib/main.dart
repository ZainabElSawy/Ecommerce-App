import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/core/constant/constants.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/providers_list.dart';
import 'core/constant/routes.dart';
import 'core/functions/langconfig.dart';
import 'core/services/notification_services.dart';
import 'features/home/data/models/categories_model.dart';
import 'features/home/data/models/item_model.dart';
// Import the generated file
import 'firebase_options.dart';

SharedPreferences? sharedPreferences;
late SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CategoriesModelAdapter());
  Hive.registerAdapter(ItemModelAdapter());
  await Hive.openBox<User>(kUser);
  await Hive.openBox<CategoriesModel>(kCategories);
  await Hive.openBox<ItemModel>(kItems);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providersList,
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            supportedLocales: LangConfig.supportedLocales,
            localizationsDelegates: LangConfig.localizationsDelegates,
            routerConfig: AppRouter.route,
            localeResolutionCallback: LangConfig.localResolutionCallbackFunc,
            title: 'E-Commerce App',
            theme:
                state.locale?.languageCode == "ar" ? themeArabic : themeEnglish,
          );
        },
      ),
    );
  }
}
  //  @override
  // void initState() {
  //  // NotificationController.startListeningNotificationEvents();
  //   super.initState();
  // }