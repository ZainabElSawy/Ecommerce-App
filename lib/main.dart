import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/core/constant/constants.dart';
import 'package:ecommerce_app/core/services/api_services.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:ecommerce_app/features/home/data/data_sources/home_local_datasource.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_imp.dart';
import 'package:ecommerce_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/remove_item_from_fav_cubit/remove_item_from_favorite_cubit.dart';
import 'package:ecommerce_app/features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/routes.dart';
import 'features/auth/data/data_source/auth_data_source_imp.dart';
import 'features/cart/data/datasources/cart_data_source.dart';
import 'features/cart/data/repositories/cart_repo_imp.dart';
import 'features/home/data/data_sources/home_remote_datasource.dart';
import 'features/home/data/models/categories_model.dart';
import 'features/home/data/models/item_model.dart';
import 'features/home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'features/home/presentation/manager/items_cubit/items_cubit.dart';
import 'features/home/presentation/manager/items_for_cat_cubit/items_for_category_cubit.dart';
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
      providers: [
        BlocProvider<LocaleCubit>(
          create: (BuildContext context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<AddtoCartCubit>(
          create: (BuildContext context) => AddtoCartCubit(
              CartRepoImp(CartDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<VerifyCodeCubit>(
          create: (BuildContext context) => VerifyCodeCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<ForgetPasswordCubit>(
          create: (BuildContext context) => ForgetPasswordCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<CategoriesCubit>(
          create: (BuildContext context) => CategoriesCubit(HomeRepoImp(
              homeRemoteDataSource:
                  HomeRemoteDataSourceImp(ApiService(dio: Dio())),
              homeLocalDataSource:
                  HomeLocalDataSourceImp(ApiService(dio: Dio()))))
            ..fetchCategories(),
        ),
        BlocProvider<ItemsCubit>(
            create: (BuildContext context) => ItemsCubit(HomeRepoImp(
                homeRemoteDataSource:
                    HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                homeLocalDataSource:
                    HomeLocalDataSourceImp(ApiService(dio: Dio()))))
              ..fetchItems()),
        BlocProvider<ItemsForCategoryCubit>(
            create: (BuildContext context) => ItemsForCategoryCubit(HomeRepoImp(
                homeRemoteDataSource:
                    HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                homeLocalDataSource:
                    HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
        BlocProvider<FavoriteCubit>(
            create: (BuildContext context) => FavoriteCubit(HomeRepoImp(
                homeRemoteDataSource:
                    HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                homeLocalDataSource:
                    HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
        BlocProvider<RemoveItemFromFavoriteCubit>(
            create: (BuildContext context) => RemoveItemFromFavoriteCubit(
                HomeRepoImp(
                    homeRemoteDataSource:
                        HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                    homeLocalDataSource:
                        HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
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
