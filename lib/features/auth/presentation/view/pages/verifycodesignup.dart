import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../../../../../core/constant/color.dart';
import '../widget/customtextbodyauth.dart';
import '../widget/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            S.of(context).verifycode,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.grey),
          ),
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
                    context.pushPage(route: AppRouter.successSignUp),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}
