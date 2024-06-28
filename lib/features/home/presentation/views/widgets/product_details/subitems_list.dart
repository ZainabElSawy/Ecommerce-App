import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class SubitemsList extends StatelessWidget {
  final List subitems;
  const SubitemsList({
    Key? key,
    required this.subitems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
              color: subitems[index]["active"] == "0"
                  ? AppColor.white
                  : AppColor.fourthcolor,
              border: Border.all(color: AppColor.fourthcolor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              subitems[index]["name"],
              style: TextStyle(
                color: subitems[index]["active"] == "1"
                    ? AppColor.white
                    : AppColor.fourthcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


