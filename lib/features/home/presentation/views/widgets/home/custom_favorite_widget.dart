import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class FavoriteWidget extends StatelessWidget {
  final void Function()? onFavoritePressed;
  const FavoriteWidget({
    Key? key,
    this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onFavoritePressed,
        icon: const Icon(
          size: 30,
          Icons.favorite_border_outlined,
          color: AppColor.grey,
        ),
      ),
    );
  }
}
