import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../generated/l10n.dart';
import '../../../manager/forget_password_cubit/forget_password_cubit.dart';
import '../customtextbodyauth.dart';
import '../customtexttitleauth.dart';

class VerifyCodeForgetPassContent extends StatelessWidget {
  const VerifyCodeForgetPassContent({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            onSubmit: (String verificationCode) { 
              context.read<ForgetPasswordCubit>().code = verificationCode;
              context
                .read<ForgetPasswordCubit>()
                .verifyCode(
                    email: email,
                    verifyCode:
                        int.parse(verificationCode));},
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}