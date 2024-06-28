import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../core/constant/color.dart';
import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/functions/custom_error_snack_bar.dart';
import '../../../../../core/shared/failure_widget.dart';
import '../../manager/verify_code_cubit/verify_code_cubit.dart';
import '../widget/customauthappbar.dart';
import '../widget/verify_code_sign_up_content.dart';

class VerifyCodeSignUp extends StatelessWidget {
  final String email;
  const VerifyCodeSignUp({
    Key? key,
    required this.email,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: CustomAuthAppBar(title: S.of(context).verifycode),
      body: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccess) {
            context.pushPage(route: AppRouter.successSignUp);
          } else if (state is VerifyCodeFailure) {
            customSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is VerifyCodeLoading) {
            return Center(child: Lottie.asset(AppImageAsset.loading));
          } else if (state is VerifyCodeNetworkFailure) {
            return FailureWidget(
              onPressed: () => verifyCodeMethod(context),
              image: AppImageAsset.internet,
            );
          } else if (state is VerifyCodeServerFailure) {
            return FailureWidget(
              onPressed: () => verifyCodeMethod(context),
              image: AppImageAsset.server,
            );
          } else {
            return VerifyCodeSignUpContent(email: email);
          }
        },
      ),
    );
  }

  void verifyCodeMethod(BuildContext context) {
    context.read<VerifyCodeCubit>().verifyCodeSignUp(
        email: email,
        verifyCode: int.parse(context.read<VerifyCodeCubit>().verifyCode));
  }
}
