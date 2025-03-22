import 'package:flutter/material.dart';

import '../../../../../core/shared/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/view/widget/customtextformauth.dart';

class AddAddressDetailsListView extends StatelessWidget {
  const AddAddressDetailsListView({
    Key? key,
    required this.city,
    required this.street,
    required this.name,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController? city;
  final TextEditingController? street;
  final TextEditingController? name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        CustomTextFormAuth(
          hintText: S.of(context).city,
          labelText: S.of(context).city,
          // iconData: Icons.location_city,
          myController: city,
        ),
        CustomTextFormAuth(
          hintText: S.of(context).street,
          labelText: S.of(context).street,
          // iconData: Icons.streetview,
          myController: street,
        ),
        CustomTextFormAuth(
          hintText: S.of(context).name,
          labelText: S.of(context).name,
          // iconData: Icons.near_me,
          myController: name,
        ),
        CustomButton(
          text: S.of(context).add,
          onTap: onPressed,
        )
      ],
    );
  }
}
