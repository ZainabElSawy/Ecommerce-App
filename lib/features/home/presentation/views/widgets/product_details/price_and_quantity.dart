import 'package:ecommerce_app/features/home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constant/color.dart';

class PriceAndQuantity extends StatefulWidget {
  final int itemId;
  final int price;
  const PriceAndQuantity({
    Key? key,
    required this.price,
    required this.itemId,
  }) : super(key: key);

  @override
  State<PriceAndQuantity> createState() => _PriceAndQuantityState();
}

class _PriceAndQuantityState extends State<PriceAndQuantity> {
  int count = 0;

  @override
  void initState() {
    _initCount();
    super.initState();
  }

  void _initCount() async {
    final int itemCount = int.parse(
        await BlocProvider.of<AddtoCartCubit>(context)
            .itemsCountCart(itemId: widget.itemId));
    setState(() {
      count = itemCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(children: [
        IconButton(
            onPressed: () {
              setState(() {
                count++;
              });
              BlocProvider.of<AddtoCartCubit>(context)
                  .addToCart(itemId: widget.itemId);
            },
            icon: const Icon(Icons.add)),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 4),
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.black),
          ),
          child: Text(
            count.toString(),
            style: const TextStyle(fontSize: 20, height: 1.1),
          ),
        ),
        IconButton(
            onPressed: () {
              if (count > 0) {
                setState(() {
                  count--;
                });
                BlocProvider.of<AddtoCartCubit>(context)
                    .removeFromCart(itemId: widget.itemId);
              }
            },
            icon: const Icon(Icons.remove)),
      ]),
      const Spacer(),
      Text(
        "${widget.price} \$",
        style: const TextStyle(color: AppColor.primarycolor, fontSize: 30),
      ),
    ]);
  }
}
