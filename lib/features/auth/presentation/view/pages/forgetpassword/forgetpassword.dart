import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../core/constant/color.dart';
import '../../../../../../../../../core/functions/validinput.dart';
import '../../../../../../generated/l10n.dart';
import '../../widget/customauthappbar.dart';
import '../../widget/custombuttonauth.dart';
import '../../widget/customtextbodyauth.dart';
import '../../widget/customtextformauth.dart';
import '../../widget/customtexttitleauth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController email;
  @override
  void initState() {
    email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: CustomAuthAppBar(
          title: S.of(context).forgetpassword,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomTextTiteAuth(title: S.of(context).checkemail),
              const SizedBox(height: 10),
              CustomTextBodyAuth(content: S.of(context).forgetpasscontent),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val) => validInput(val!, 5, 100, "email"),
                hintText: S.of(context).enteryouremail,
                labelText: S.of(context).email,
                iconData: Icons.email_outlined,
                myController: email,
              ),
              CustomButtonAuth(
                text: S.of(context).check,
                onPressed: () => context.pushPage(route: AppRouter.verifyCode),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}
