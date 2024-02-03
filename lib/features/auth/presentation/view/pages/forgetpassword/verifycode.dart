import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/view/widget/customauthappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../../../../../core/constant/color.dart';
import '../../../../../../generated/l10n.dart';
import '../../widget/customtextbodyauth.dart';
import '../../widget/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: CustomAuthAppBar(
          title: S.of(context).verifycode,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomTextTiteAuth(title: S.of(context).checkcode),
              const SizedBox(height: 10),
              CustomTextBodyAuth(content: S.of(context).checkcodecontent),
              const SizedBox(height: 15),
              OtpTextField(
                focusedBorderColor: AppColor.primarycolor,
                cursorColor: AppColor.primarycolor,
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: AppColor.primarycolor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                onSubmit: (String verificationCode) =>
                    context.pushPage(route: AppRouter.resetPassword),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}
