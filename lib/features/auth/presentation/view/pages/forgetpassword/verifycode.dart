import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/auth/presentation/view/widget/customauthappbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/imageassets.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../../../../core/functions/custom_error_snack_bar.dart';
import '../../../../../../generated/l10n.dart';
import '../../../manager/forget_password_cubit/forget_password_cubit.dart';
import '../../widget/auth_failure_state.dart';
import '../../widget/forget_password/verify_code_forget_pass_content.dart';

class VerifyCode extends StatelessWidget {
  final String email;
  const VerifyCode({
    Key? key,
    required this.email,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: CustomAuthAppBar(
        title: S.of(context).verifycode,
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            context.pushPage(route: AppRouter.resetPassword);
          } else if (state is ForgetPasswordFailure) {
            customSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is ForgetPasswordLoading) {
            return Center(child: Lottie.asset(AppImageAsset.loading));
          } else if (state is ForgetPasswordNetworkFailure) {
            return AuthFailureState(
              onPressed: () => verifyCodeMethod(context),
              image: AppImageAsset.internet,
            );
          } else if (state is ForgetPasswordServerFailure) {
            return AuthFailureState(
              onPressed: () => verifyCodeMethod(context),
              image: AppImageAsset.server,
            );
          } else {
            return VerifyCodeForgetPassContent(email: email);
          }
        },
      ),
    );
  }

  verifyCodeMethod(BuildContext context) {
    context.read<ForgetPasswordCubit>().verifyCode(
          email: email,
          verifyCode: int.parse(context.read<ForgetPasswordCubit>().code),
        );
  }
}


//context.pushPage(route: AppRouter.resetPassword),