import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../../../core/constant/color.dart';
import '../../../../../../core/constant/imageassets.dart';
import '../../../../../../core/functions/custom_error_snack_bar.dart';
import '../../../../../../core/shared/failure_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../widget/forget_password/check_email_content.dart';
import '../../widget/customauthappbar.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
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
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            context.pushPage(route: AppRouter.verifyCode, extra: email.text);
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
            return CheckEmailContent(email: email);
          }
        },
      ),
    );
  }

  void checkEmailMethod() {
    context.read<ForgetPasswordCubit>().checkEmail(email: email.text);
  }
}
