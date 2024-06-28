import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../widgets/consumbuttonlang.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).one,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ConsumButtonLang(
              textButton: S.of(context).two,
              onPressed: () {
                sharedPreferences?.setString("lang", "ar");
                context.read<LocaleCubit>().changeLanguage("ar");
                context.pushPage(route: AppRouter.onBoarding);
              },
            ),
            ConsumButtonLang(
              textButton: S.of(context).three,
              onPressed: () {
                sharedPreferences?.setString("lang", "en");
                context.read<LocaleCubit>().changeLanguage("en");
                context.pushPage(route: AppRouter.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
