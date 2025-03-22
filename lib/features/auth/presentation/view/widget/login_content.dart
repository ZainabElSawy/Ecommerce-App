import 'package:ecommerce_app/core/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/login_cubit/login_cubit.dart';

import 'custom_account_row.dart';
import 'custom_auth_divider.dart';
import 'custom_auth_subtitle.dart';
import 'custom_auth_title.dart';
import 'custom_sign_with_social_row.dart';
import 'custom_text_button.dart';
import 'customtextformauth.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
    required this.email,
    required this.password,
    required this.formState,
  });

  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 82.h),
            const CustomAuthTitle(title: "Sign In"),
            SizedBox(height: 12.h),
            const CustomAuthSubTitle(
                subTitle: "Hi! Welcome back, you've been missed"),
            SizedBox(height: 44.h),
            CustomTextFormAuth(
              valid: (val) => validInput(val!, 5, 100, "email"),
              hintText: "example@gmail.com",
              labelText: S.of(context).email,
              myController: email,
            ),
            SizedBox(height: 16.h),
            CustomTextFormAuth(
              isPassword: true,
              valid: (val) => validInput(val!, 5, 30, "password"),
              hintText: "*************",
              labelText: S.of(context).password,
              myController: password,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Spacer(),
                CustomTextButton(
                  text: "Forget Password?",
                  onTap: () =>
                      context.pushPage(route: AppRouter.forgetPassword),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            CustomButton(
              text: "Sign In",
              onTap: () {
                var formdata = formState.currentState;
                if (formdata!.validate()) {
                  BlocProvider.of<LoginCubit>(context)
                      .login(email: email.text, password: password.text);
                }
              },
            ),
            const CustomAuthDivider(text: "Or sign in with"),
            const CutomSignWithSocialRow(),
            SizedBox(height: 40.h),
            CustomAccountRow(
              text1: "Don't have an account? ",
              text2: "Sign Up",
              onTap: () => context.pushPage(route: AppRouter.login),
            )
          ],
        ),
      ),
    );
  }
}
