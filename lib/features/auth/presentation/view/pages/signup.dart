import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/alertexitapp.dart';
import 'package:ecommerce_app/features/auth/presentation/view/widget/customauthappbar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../../core/constant/color.dart';
import '../../../../../core/functions/custom_error_snack_bar.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../widget/signup_content.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  void initState() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: CustomAuthAppBar(title: S.of(context).signup),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async => alertExitApp(context),
        child: Form(
          key: formstate,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            padding: const EdgeInsets.all(15),
            child: BlocConsumer<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: Lottie.asset(AppImageAsset.loading));
                } else if (state is AuthNetworkFailure) {
                  return Center(child: Lottie.asset(AppImageAsset.internet));
                } else if (state is AuthServerFailure) {
                  return Center(child: Lottie.asset(AppImageAsset.server));
                } else {
                  return SignUpContent(
                    username: username,
                    email: email,
                    phone: phone,
                    password: password,
                    formstate: formstate,
                  );
                }
              },
              listener: (BuildContext context, AuthState state) {
                if (state is AuthSuccess) {
                  context.pushPage(
                    route: AppRouter.verifyCodeSignUp,
                    extra: email.text,
                  );
                } else if (state is AuthFailure) {
                  customSnackBar(context, state.errMessage);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

