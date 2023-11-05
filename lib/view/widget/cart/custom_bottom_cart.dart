import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/constant/color.dart';

import 'custom_btn_cart.dart';
import 'custom_text_check_out.dart';

class CustomBottomCart extends StatelessWidget {
  final String countTotal;
  final String totalPriceOrder;
  final String shipping;
  final String disCount;
  final String total;
  final bool? isEnabledCoupon;
  final void Function()? onPressedCoupon;
  final TextEditingController couponController;
  const CustomBottomCart({
    Key? key,
    required this.countTotal,
    required this.totalPriceOrder,
    required this.shipping,
    required this.total,
    required this.couponController,
    required this.disCount,
    required this.onPressedCoupon,
    required this.isEnabledCoupon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: TextFormField(
                      enabled: isEnabledCoupon,
                      controller: couponController,
                      cursorColor: AppColor.primaryColor,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.primaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.primaryColor)),
                        hintText: "Coupon Code",
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 4,
                        ),
                      ),
                    )),
                const SizedBox(width: 5),
                Expanded(
                    child: isEnabledCoupon!
                        ? MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppColor.primaryColor,
                            textColor: AppColor.backgroundcolor,
                            onPressed: onPressedCoupon,
                            child: const Text("Apply"),
                          )
                        : MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.grey.shade600,
                            textColor: AppColor.backgroundcolor,
                            onPressed: () {},
                            child: const Text("Apply"),
                          ))
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.primaryColor),
            ),
            child: Padding(
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
                  textF: 'DisCount',
                  textL: disCount,
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
          ),
          const SizedBox(height: 15),
          const CustomCheckOutBtn(),
        ],
      ),
    );
  }
}
