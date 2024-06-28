import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/core/constant/constants.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/providers_list.dart';
import 'core/constant/routes.dart';
import 'features/home/data/models/categories_model.dart';
import 'features/home/data/models/item_model.dart';
import 'generated/l10n.dart';
// Import the generated file
import 'firebase_options.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providersList,
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            supportedLocales: supportedLocales,
            localizationsDelegates: localizationsDelegates,
            localeResolutionCallback: localResolutionCallbackFunc,
            title: 'E-Commerce App',
            theme:
                state.locale?.languageCode == "ar" ? themeArabic : themeEnglish,
            routerConfig: AppRouter.route,
          );
        },
      ),
    );
  }
}

Locale? localResolutionCallbackFunc(deviceLocale, supportedLocales) {
  for (var locale in supportedLocales) {
    if (deviceLocale != null &&
        deviceLocale.languageCode == locale.languageCode) {
      return deviceLocale;
    }
  }
  return supportedLocales.first;
}

final Iterable<Locale> supportedLocales = [
  const Locale('en'),
  const Locale("ar"),
];
const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
