import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomitemsCart extends StatelessWidget {
  const CustomitemsCart({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.count,
    this.onAdd,
    this.onRemove, this.onTap,
  }) : super(key: key);
  final String image;
  final String name;
  final String price;
  final String count;
  final void Function()? onTap;
  final void Function()? onAdd;
  final void Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.network(
                  image,
                  height: 80,
                  fit: BoxFit.fill,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                    price,
                    style: const TextStyle(
                      color: AppColor.primarycolor,
                      fontSize: 17,
                    ),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 38,
                  child:
                      IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: Text(
                    count,
                    style: const TextStyle(fontFamily: "sans"),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: IconButton(
                      onPressed: onRemove, icon: const Icon(Icons.remove)),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
