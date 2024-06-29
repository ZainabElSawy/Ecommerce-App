import 'package:flutter/cupertino.dart';

import 'custom_favorite_widget.dart';
import 'custom_search_widget.dart';

class CustomAppBar extends StatelessWidget {
  final String searchTitle;
  final TextEditingController textEditingController;
  final void Function()? onNotificationPressed;
  final void Function()? onFavoritePressed;
  final void Function()? onSearchPressed;
  final void Function(String)? onChanged;
  const CustomAppBar({
    Key? key,
    required this.searchTitle,
    this.onNotificationPressed,
    this.onFavoritePressed,
    this.onSearchPressed, this.onChanged, required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSearchWidget(textEditingController: textEditingController,
          onChanged: onChanged,
          onSearchPressed: onSearchPressed,
          searchTitile: searchTitle,
        ),
        const SizedBox(width: 10),
        FavoriteWidget(onFavoritePressed: onFavoritePressed),
      ],
    );
  }
}
        // NotificationWidget(onNotificationPressed: onNotificationPressed),
        // const SizedBox(width: 10),
