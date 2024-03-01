import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';

import '../../../../../../core/functions/validinput.dart';
import '../../../../../../generated/l10n.dart';
import '../custombuttonauth.dart';
import '../customtextbodyauth.dart';
import '../customtextformauth.dart';
import '../customtexttitleauth.dart';

class ResetPasswordContent extends StatelessWidget {
  ResetPasswordContent({
    Key? key,
    required this.email,
    required this.password,
    required this.rePassword,
  }) : super(key: key);
  final String email;
  final TextEditingController password;
  final TextEditingController rePassword;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomTextTiteAuth(title: S.of(context).newpass),
            const SizedBox(height: 10),
            CustomTextBodyAuth(content: S.of(context).signUpcontent),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) => validInput(val!, 5, 30, "password"),
              hintText: S.of(context).enteryourpassword,
              labelText: S.of(context).newpass,
              myController: password,
              isPassword: true,
            ),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                if (password.text != rePassword.text) {
                  return "password and repassword must be the same";
                }
                return null;
              },
              hintText: S.of(context).reenteryourpassword,
              labelText: S.of(context).newpass,
              isPassword: true,
              myController: rePassword,
            ),
            CustomButtonAuth(
                text: S.of(context).save,
                onPressed: () {
                  if (formState.currentState!.validate()) {
                    BlocProvider.of<ForgetPasswordCubit>(context).resetPassword(
                        email: email, newPassword: rePassword.text);
                  }
                }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
