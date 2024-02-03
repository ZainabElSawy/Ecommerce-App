import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../core/functions/alertexitapp.dart';
import '../../../../../generated/l10n.dart';
import '../widget/customauthappbar.dart';
import '../widget/custombuttonauth.dart';
import '../widget/customtextbodyauth.dart';
import '../widget/customtextformauth.dart';
import '../widget/customtextsignuporsignin.dart';
import '../widget/customtexttitleauth.dart';
import '../widget/logoauth.dart';

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
          child: Container(
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
                  onTap: () =>
                      context.pushPage(route: AppRouter.forgetPassword),
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
                      print("valid");
                    } else {
                      print("Not valid");
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
          ),
        ),
      ),
    );
  }
  
}
