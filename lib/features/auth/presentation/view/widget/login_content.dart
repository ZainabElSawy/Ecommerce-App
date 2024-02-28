import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/login_cubit/login_cubit.dart';
import 'custombuttonauth.dart';
import 'customtextbodyauth.dart';
import 'customtextformauth.dart';
import 'customtextsignuporsignin.dart';
import 'customtexttitleauth.dart';
import 'logoauth.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
    required this.email,
    required this.password,
    required this.formState,
  });

  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const LogoAuth(),
          CustomTextTiteAuth(title: S.of(context).signintitle),
          const SizedBox(height: 10),
          CustomTextBodyAuth(content: S.of(context).signincontent),
          const SizedBox(height: 15),
          CustomTextFormAuth(
            valid: (val) => validInput(val!, 5, 100, "email"),
            hintText: S.of(context).enteryouremail,
            labelText: S.of(context).email,
            iconData: Icons.email_outlined,
            myController: email,
          ),
          CustomTextFormAuth(
            isPassword: true,
            valid: (val) => validInput(val!, 5, 30, "password"),
            hintText: S.of(context).enteryourpassword,
            labelText: S.of(context).password,
            myController: password,
          ),
          GestureDetector(
            onTap: () => context.pushPage(route: AppRouter.forgetPassword),
            child: Text(
              S.of(context).forgetpassword,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily:
                    // myServices.sharedPreferences!.getString("lang") ==
                    //         "en"
                    //     ? "PlayfairDisplay"
                    //     :
                    "Cairo",
              ),
              textAlign: TextAlign.end,
            ),
          ),
          CustomButtonAuth(
            text: S.of(context).signin,
            onPressed: () {
              var formdata = formState.currentState;
              if (formdata!.validate()) {
                BlocProvider.of<LoginCubit>(context)
                    .login(email: email.text, password: password.text);
              }
            },
          ),
          const SizedBox(height: 30),
          CustomTextSignUpOrSignIn(
            textone: S.of(context).donthaveanaccount,
            texttwo: S.of(context).signup,
            onTap: () => context.pushPage(route: AppRouter.signup),
          ),
        ],
      ),
    );
  }
}
