import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/routes.dart';
import '../widget/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          S.of(context).success,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primarycolor,
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).congratulations,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).successfullyregistered,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
            ),
            const Spacer(),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: CustomButtonAuth(
                    text: S.of(context).gotologin,
                    onPressed: ()=>context.pushPage(route: AppRouter.login))),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
