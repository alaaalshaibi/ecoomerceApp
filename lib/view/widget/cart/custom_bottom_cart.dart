import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/constant/color.dart';

import 'custom_btn_cart.dart';
import 'custom_text_check_out.dart';

class CustomBottomCart extends StatelessWidget {
  final String countTotal;
  final String totalPriceOrder;
  final String shipping;
  final String total;
  const CustomBottomCart({
    Key? key,
    required this.countTotal,
    required this.totalPriceOrder,
    required this.shipping,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(children: [
              CustomTextCheckOut(
                textF: 'Count Items',
                textL: countTotal,
              ),
              CustomTextCheckOut(
                textF: 'Price',
                textL: totalPriceOrder,
              ),
              CustomTextCheckOut(
                textF: 'Shipping',
                textL: shipping,
              ),
              const Divider(),
              CustomTextCheckOut(
                textF: 'Total',
                textL: total,
                color: AppColor.primaryColor,
              ),
            ]),
          ),
          const SizedBox(height: 15),
          const CustomCheckOutBtn(),
        ],
      ),
    );
  }
}
