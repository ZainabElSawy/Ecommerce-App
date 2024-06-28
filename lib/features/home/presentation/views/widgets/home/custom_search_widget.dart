import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomSearchWidget extends StatelessWidget {
  final void Function()? onSearchPressed;
  final String searchTitile;
  const CustomSearchWidget({
    Key? key,
    this.onSearchPressed,
    required this.searchTitile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onSearchPressed,
            icon: const Icon(CupertinoIcons.search, color: AppColor.grey),
          ),
          hintText: searchTitile,
          hintStyle: const TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}