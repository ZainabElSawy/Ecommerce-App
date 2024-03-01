import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/constant/routes.dart';
import '../../../../../core/functions/alertexitapp.dart';
import '../../../../../core/functions/custom_error_snack_bar.dart';
import '../../../../../generated/l10n.dart';
import '../widget/auth_failure_state.dart';
import '../widget/customauthappbar.dart';
import '../widget/login_content.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("***********************");
      print(token);
      print("***********************");
    });
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: CustomAuthAppBar(title: S.of(context).signin),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async => alertExitApp(context),
        child: Form(
          key: formState,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.pushPage(route: AppRouter.home);
              } else if (state is LoginFailure) {
                customSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(child: Lottie.asset(AppImageAsset.loading));
              } else if (state is LoginNetworkFailure) {
                return AuthFailureState(
                  onPressed: loginMethod,
                  image: AppImageAsset.internet,
                );
              } else if (state is LoginServerFailure) {
                return AuthFailureState(
                  onPressed: loginMethod,
                  image: AppImageAsset.server,
                );
              } else {
                return LoginContent(
                  email: email,
                  password: password,
                  formState: formState,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void loginMethod() {
    BlocProvider.of<LoginCubit>(context)
        .login(email: email.text, password: password.text);
  }
}
