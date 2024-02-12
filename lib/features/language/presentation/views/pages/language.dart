import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/checkinterner.dart';
import 'package:ecommerce_app/features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/consumbuttonlang.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  var res;
  initialData() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

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
                context.read<LocaleCubit>().changeLanguage("ar");
                context.pushPage(route: AppRouter.onBoarding);
              },
            ),
            ConsumButtonLang(
              textButton: S.of(context).three,
              onPressed: () {
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
