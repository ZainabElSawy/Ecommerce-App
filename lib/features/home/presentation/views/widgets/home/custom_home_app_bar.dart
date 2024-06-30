import 'package:flutter/cupertino.dart';

import 'custom_favorite_widget.dart';
import 'custom_search_widget.dart';

class CustomAppBar extends StatelessWidget {
  final String searchTitle;
  final TextEditingController textEditingController;
  final void Function()? onFavoritePressed;
  final void Function(String)? onChanged;
  const CustomAppBar({
    Key? key,
    required this.searchTitle,
    this.onFavoritePressed,this.onChanged, required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSearchWidget(textEditingController: textEditingController,
          onChanged: onChanged,
          searchTitile: searchTitle,
        ),
        const SizedBox(width: 10),
        FavoriteWidget(onFavoritePressed: onFavoritePressed),
      ],
    );
  }
}
        
