import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/routes.dart';
import 'generated/l10n.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(
          create: (BuildContext context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
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


  Locale? localResolutionCallbackFunc(deviceLocale, supportedLocales) {
    for (var locale in supportedLocales) {
      if (deviceLocale != null &&
          deviceLocale.languageCode == locale.languageCode) {
        return deviceLocale;
      }
    }
    return supportedLocales.first;
  }

  final Iterable<Locale> supportedLocales = const [
    Locale('en'),
    Locale("ar"),
  ];
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates =
      const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

