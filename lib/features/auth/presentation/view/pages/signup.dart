import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/alertexitapp.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/features/auth/presentation/view/widget/customauthappbar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../core/constant/color.dart';
import '../widget/custombuttonauth.dart';
import '../widget/customtextbodyauth.dart';
import '../widget/customtextformauth.dart';
import '../widget/customtextsignuporsignin.dart';
import '../widget/customtexttitleauth.dart';

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
            child: ListView(
              children: [
                CustomTextTiteAuth(title: S.of(context).signuptitle),
                const SizedBox(height: 10),
                CustomTextBodyAuth(content: S.of(context).signUpcontent),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) => validInput(val!, 3, 30, "username"),
                  hintText: S.of(context).enteryourusername,
                  labelText: S.of(context).username,
                  iconData: Icons.person_outline,
                  myController: username,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) => validInput(val!, 5, 100, "email"),
                  hintText: S.of(context).enteryouremail,
                  labelText: S.of(context).email,
                  iconData: Icons.email_outlined,
                  myController: email,
                ),
                CustomTextFormAuth(
                  isNumber: true,
                  valid: (val) => validInput(val!, 11, 18, "phone"),
                  hintText: S.of(context).enteryourphone,
                  labelText: S.of(context).phone,
                  iconData: Icons.phone_android_outlined,
                  myController: phone,
                ),
                CustomTextFormAuth(
                  isPassword: true,
                  isNumber: false,
                  valid: (val) => validInput(val!, 5, 30, "password"),
                  hintText: S.of(context).enteryourpassword,
                  labelText: S.of(context).password,
                  myController: password,
                ),
                CustomButtonAuth(
                    text: S.of(context).signup,
                    onPressed: () {
                      var formdata = formstate.currentState;
                      if (formdata!.validate()) {
                        context.pushPage(route: AppRouter.verifyCodeSignUp);
                      } else {
                        print("Not valid");
                      }
                    }),
                const SizedBox(height: 30),
                CustomTextSignUpOrSignIn(
                  textone: S.of(context).haveanaccount,
                  texttwo: S.of(context).signin,
                  onTap: () => context.pushPage(route: AppRouter.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
