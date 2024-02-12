import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/core/services/api_services.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
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
  //sharedPreferences = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider<AuthCubit>(
          create: (BuildContext context) =>
              AuthCubit(AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
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

final Iterable<Locale> supportedLocales =  [
  const Locale('en'),
  const Locale("ar"),
];
const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
[
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];