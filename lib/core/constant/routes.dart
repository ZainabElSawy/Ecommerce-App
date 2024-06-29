import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/check_email.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/verifycode.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/signup.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/success_signup.dart';
import 'package:ecommerce_app/features/cart/data/datasources/cart_data_source.dart';
import 'package:ecommerce_app/features/cart/data/repositories/cart_repo_imp.dart';
import 'package:ecommerce_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/cart/presentation/views/pages/cart.dart';
import 'package:ecommerce_app/features/home/presentation/views/pages/items_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/pages/product_details_view.dart';

import 'package:ecommerce_app/features/onboarding/presentation/views/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/presentation/view/pages/login.dart';
import '../../features/auth/presentation/view/pages/verifycodesignup.dart';
import '../../features/home/data/data_sources/home_local_datasource.dart';
import '../../features/home/data/data_sources/home_remote_datasource.dart';
import '../../features/home/data/models/item_model.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/home/presentation/manager/my_favorite_item_cubit/my_favorite_items_cubit.dart';
import '../../features/home/presentation/views/pages/favorite_view.dart';
import '../../features/home/presentation/views/pages/home_page.dart';
import '../../features/language/presentation/views/pages/language.dart';
import '../../features/onboarding/presentation/manager/onboarding_cubit/on_boarding_cubit.dart';
import '../../main.dart';
import '../services/api_services.dart';

abstract class AppRouter {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgetPassword = "/forgetpassword";
  static const String verifyCode = "/verifycode";
  static const String resetPassword = "/resetpassword";
  static const String onBoarding = "/onboarding";
  static const String successResetPassword = "/successresetpassword";
  static const String successSignUp = "/successsignup";
  static const String verifyCodeSignUp = "/verifycodesignup";
  static const String home = "/home";
  static const String items = "/items";
  static const String productDetails = "/productdetails";
  static const String favorite = "/favorite";
  static const String cart = "/cart";
  static final route = GoRouter(
    routes: [
      //Language
      GoRoute(
        path: "/",
        builder: (context, state) => sharedPreferences?.getInt("userid") != null
            ? const HomePage()
            : sharedPreferences?.getString("onboarding") == null
                ? const Language()
                : const Login(),
        // builder: (context, state) => const Language(),
      ),
      //OnBoarding
      GoRoute(
          path: onBoarding,
          builder: (context, state) => BlocProvider(
                create: (context) => OnBoardingCubit(),
                child: const OnBoarding(),
              )),
      //Auth
      GoRoute(path: login, builder: (context, state) => const Login()),
      GoRoute(path: signup, builder: (context, state) => const SignUp()),
      GoRoute(
        path: verifyCodeSignUp,
        builder: (context, state) =>
            VerifyCodeSignUp(email: state.extra as String),
      ),
      GoRoute(
          path: forgetPassword,
          builder: (context, state) => const CheckEmail()),
      GoRoute(
        path: verifyCode,
        builder: (context, state) => VerifyCode(email: state.extra as String),
      ),
      GoRoute(
          path: resetPassword,
          builder: (context, state) =>
              ResetPassword(email: state.extra as String)),
      GoRoute(
          path: successResetPassword,
          builder: (context, state) => const SuccessResetPassword()),
      GoRoute(
          path: successSignUp,
          builder: (context, state) => const SuccessSignUp()),
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: cart,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              CartCubit(CartRepoImp(CartDataSourceImp(ApiService(dio: Dio()))))
                ..fetchCartView(),
          child: const Cart(),
        ),
      ),
      GoRoute(
        path: items,
        builder: (context, state) => Items(
          categories: (state.extra as Map<String, dynamic>?)?["categories"]
                  as List<CategoriesModel>? ??
              [],
          selectedCategory: (state.extra
                  as Map<String, dynamic>?)?["selectedCategory"] as int? ??
              0,
        ),
      ),
      GoRoute(
        path: productDetails,
        builder: (context, state) =>
            ProductDetails(itemModel: state.extra as ItemModel),
      ),
      GoRoute(
          path: favorite,
          builder: (context, state) => BlocProvider<MyFavoriteItemsCubit>(
                create: (BuildContext context) => MyFavoriteItemsCubit(
                    HomeRepoImp(
                        homeRemoteDataSource:
                            HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                        homeLocalDataSource:
                            HomeLocalDataSourceImp(ApiService(dio: Dio()))))
                  ..fetchMyFavoriteItems(),
                child: const FavoriteView(),
              )),
    ],
  );
}

extension RoutingX on BuildContext {
  void pushPage({required String route, Object? extra}) {
    GoRouter.of(this).push(route, extra: extra);
  }
}

extension RoutingY on BuildContext {
  void pushReplacePage({required String route, Object? extra}) {
    GoRouter.of(this).pushReplacement(route, extra: extra);
  }
}

User? retrieveUser() {
  var userBox = Hive.box<User>('userBox');
  return userBox.get('userKey');
}
