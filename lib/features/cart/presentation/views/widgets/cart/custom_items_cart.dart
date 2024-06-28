import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomitemsCart extends StatelessWidget {
  const CustomitemsCart({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.count,
  }) : super(key: key);
  final String image;
  final String name;
  final String price;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                image,
                height: 97,
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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
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
                    onPressed: () {}, icon: const Icon(Icons.remove)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
