import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/check_email.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/forgetpassword/verifycode.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/signup.dart';
import 'package:ecommerce_app/features/auth/presentation/view/pages/success_signup.dart';

import 'package:ecommerce_app/features/onboarding/presentation/views/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/presentation/view/pages/login.dart';
import '../../features/auth/presentation/view/pages/verifycodesignup.dart';
import '../../features/home/presentation/views/pages/home.dart';
import '../../features/language/presentation/views/pages/language.dart';
import '../../features/onboarding/presentation/manager/onboarding_cubit/on_boarding_cubit.dart';
import '../../main.dart';

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
  static final route = GoRouter(
    routes: [
      //Language
      GoRoute(
        path: "/",
        builder: (context, state) => retrieveUser() != null
            ? const Home()
            : sharedPreferences?.getString("onboarding") == null
                ? const Language()
                : const Login(),
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
      GoRoute(path: home, builder: (context, state) => const Home()),
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
