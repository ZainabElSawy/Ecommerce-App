import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/init.dart';
import 'core/constant/providers_list.dart';
import 'core/constant/routes.dart';
import 'core/constant/styles.dart';
import 'core/functions/langconfig.dart';
import 'core/services/notification_services.dart';
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
  initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        Styles.init();
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
                localeResolutionCallback:
                    LangConfig.localResolutionCallbackFunc,
                title: 'E-Commerce App',
                theme: state.locale?.languageCode == "ar"
                    ? themeArabic
                    : themeEnglish,
              );
            },
          ),
        );
      },
    );
  }
}
