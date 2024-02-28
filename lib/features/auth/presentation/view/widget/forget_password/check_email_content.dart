import 'package:flutter/material.dart';

import '../../../../../../core/constant/routes.dart';
import '../../../../../../core/functions/validinput.dart';
import '../../../../../../generated/l10n.dart';
import '../custombuttonauth.dart';
import '../customtextbodyauth.dart';
import '../customtextformauth.dart';
import '../customtexttitleauth.dart';

class CheckEmailContent extends StatelessWidget {
  const CheckEmailContent({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
