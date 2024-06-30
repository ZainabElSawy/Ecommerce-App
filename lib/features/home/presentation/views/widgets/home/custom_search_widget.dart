import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String searchTitile;
  final void Function(String)? onChanged;
  const CustomSearchWidget({
    Key? key,
    required this.searchTitile,  this.onChanged, required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller:textEditingController ,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: (){},
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
