import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/color.dart';
import '../../../manager/settings_cubit/settings_cubit.dart';
import 'custom_offer_card.dart';

class CustomOfferCardBlocBuilder extends StatelessWidget {
  const CustomOfferCardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsSuccess) {
          return CustomOfferCard(
            title: state.settings.settingsTitlehome.toString(),
            subTitle: state.settings.settingsBodyhome.toString(),
          );
        } else if (state is SettingsLoading) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: CircularProgressIndicator(color: AppColor.primarycolor)),
          );
        } else if (state is SettingsNetworkFailure) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Icon(Icons.wifi_off)),
          );
        } else if (state is SettingsServerFailure) {
          log(state.errMessage.toString());
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Icon(Icons.error, color: Colors.red)),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
