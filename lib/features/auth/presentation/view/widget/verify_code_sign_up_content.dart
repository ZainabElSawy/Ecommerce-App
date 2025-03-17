import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/verify_code_cubit/verify_code_cubit.dart';
import 'custom_resend_row.dart';
import 'customtextbodyauth.dart';
import 'customtexttitleauth.dart';

class VerifyCodeSignUpContent extends StatelessWidget {
  const VerifyCodeSignUpContent({
    super.key,
    required this.email,
  });

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
          CustomTextBodyAuth(
              content: "${S.of(context).checkcodecontent} $email"),
          const SizedBox(height: 15),
          OtpTextField(
            focusedBorderColor: AppColor.primarycolor,
            cursorColor: AppColor.primarycolor,
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor: AppColor.primarycolor,
            showFieldAsBox: true,
            // onCodeChanged: (String code) =>
            //     ,
            onSubmit: (String verificationCode) {
              context.read<VerifyCodeCubit>().verifyCode = verificationCode;
              context.read<VerifyCodeCubit>().verifyCodeSignUp(
                  email: email,
                  verifyCode:
                      int.parse(verificationCode));
              context.read<VerifyCodeCubit>().verifyCode = "";
            },
          ),
          const SizedBox(height: 30),
          CustomResendRow(userEmail: email),
        ],
      ),
    );
  }
}
