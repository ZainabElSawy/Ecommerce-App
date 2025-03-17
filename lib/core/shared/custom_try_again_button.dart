import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class CustomTryAgainButton extends StatelessWidget {
  const CustomTryAgainButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all<Size>(const Size(170, 45)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          const Icon(Icons.refresh),
          Text(S.of(context).tryagain),
        ],
      ),
    );
  }
}
