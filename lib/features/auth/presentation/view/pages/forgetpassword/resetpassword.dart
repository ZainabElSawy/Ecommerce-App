import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/view/widget/customauthappbar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../core/constant/color.dart';
import '../../../../../../../../../core/functions/validinput.dart';
import '../../widget/custombuttonauth.dart';
import '../../widget/customtextbodyauth.dart';
import '../../widget/customtextformauth.dart';
import '../../widget/customtexttitleauth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController password;
  late TextEditingController rePassword;
  @override
  void initState() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: CustomAuthAppBar(title: S.of(context).resetpass),
        body: Container(
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
                valid: (val) => validInput(val!, 5, 30, "password"),
                hintText: S.of(context).reenteryourpassword,
                labelText: S.of(context).newpass,
                isPassword: true,
                myController: rePassword,
              ),
              CustomButtonAuth(
                text: S.of(context).save,
                onPressed: () =>
                    context.pushPage(route: AppRouter.successResetPassword),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}
