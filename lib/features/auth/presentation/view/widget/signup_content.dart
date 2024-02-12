import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'custombuttonauth.dart';
import 'customtextbodyauth.dart';
import 'customtextformauth.dart';
import 'customtextsignuporsignin.dart';
import 'customtexttitleauth.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.formstate,
  });

  final TextEditingController username;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final GlobalKey<FormState> formstate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTextTiteAuth(title: S.of(context).signuptitle),
        const SizedBox(height: 10),
        CustomTextBodyAuth(content: S.of(context).signUpcontent),
        const SizedBox(height: 15),
        CustomTextFormAuth(
          valid: (val) => validInput(val!, 3, 30, "username"),
          hintText: S.of(context).enteryourusername,
          labelText: S.of(context).username,
          iconData: Icons.person_outline,
          myController: username,
        ),
        CustomTextFormAuth(
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
          valid: (val) => validInput(val!, 5, 30, "password"),
          hintText: S.of(context).enteryourpassword,
          labelText: S.of(context).password,
          myController: password,
        ),
        CustomButtonAuth(
          text: S.of(context).signup,
          onPressed: () {
            if (formstate.currentState!.validate()) {
              context.read<AuthCubit>().signUp(
                    username: username.text,
                    email: email.text,
                    password: password.text,
                    phone: phone.text,
                  );
            }
          },
        ),
        const SizedBox(height: 30),
        CustomTextSignUpOrSignIn(
          textone: S.of(context).haveanaccount,
          texttwo: S.of(context).signin,
          onTap: () => context.pushPage(route: AppRouter.login),
        ),
      ],
    );
  }
}
