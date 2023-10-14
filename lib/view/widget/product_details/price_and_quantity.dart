import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class PriceAndQuantity extends StatelessWidget {
  final void Function()? onPressedRemove;
  final void Function()? onPressedAdd;
  final String price;
  final String priceDiscount;
  final String quantity;
  final bool isDis;
  const PriceAndQuantity({
    Key? key,
    required this.onPressedRemove,
    required this.onPressedAdd,
    required this.price,
    required this.priceDiscount,
    required this.quantity,
    required this.isDis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(children: [
        IconButton(
            onPressed: onPressedAdd,
            icon: const Icon(
              Icons.add,
              size: 30,
            )),
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(color: AppColor.primaryColor)),
          child: Text(
            quantity,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        IconButton(
            onPressed: onPressedRemove,
            icon: const Icon(
              Icons.remove,
              size: 30,
            )),
      ]),
      const Spacer(),
      if (isDis)
        Text(
          "$price \$",
          style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              fontSize: 25,
              color: AppColor.black),
        ),
      const SizedBox(width: 10),
      Text(
        "$priceDiscount \$",
        style: const TextStyle(fontSize: 25, color: AppColor.primaryColor),
      )
    ]);
  }
}
