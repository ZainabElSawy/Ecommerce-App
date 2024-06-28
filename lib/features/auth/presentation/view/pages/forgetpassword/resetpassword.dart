import 'package:flutter/material.dart';

import 'package:ecommerce_app/features/auth/presentation/view/widget/customauthappbar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/imageassets.dart';
import '../../../../../../core/constant/routes.dart';
import '../../../../../../core/functions/custom_error_snack_bar.dart';
import '../../../../../../core/shared/failure_widget.dart';
import '../../../manager/forget_password_cubit/forget_password_cubit.dart';
import '../../widget/forget_password/reset_password_content.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

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
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            context.pushReplacePage(route: AppRouter.successResetPassword);
          } else if (state is ForgetPasswordFailure) {
            customSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is ForgetPasswordLoading) {
            return Center(child: Lottie.asset(AppImageAsset.loading));
          } else if (state is ForgetPasswordNetworkFailure) {
            return FailureWidget(
              onPressed: checkEmailMethod,
              image: AppImageAsset.internet,
            );
          } else if (state is ForgetPasswordServerFailure) {
            return FailureWidget(
              onPressed: checkEmailMethod,
              image: AppImageAsset.server,
            );
          } else {
            return ResetPasswordContent(
              password: password,
              rePassword: rePassword,
              email: widget.email,
            );
          }
        },
      ),
    );
  }

  checkEmailMethod() {
    BlocProvider.of<ForgetPasswordCubit>(context).resetPassword(
      email: widget.email,
      newPassword: rePassword.text,
    );
  }
}
