import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ChoosePaymentMethod extends StatelessWidget {
  final String methodPayment;
  final bool isActive;
  final void Function() onTap;
  const ChoosePaymentMethod({
    Key? key,
    required this.methodPayment,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color:
                  isActive ? AppColor.primaryColor : AppColor.primarySoundColor,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            methodPayment,
            style: TextStyle(
                color:
                    isActive ? AppColor.backgroundcolor : AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                height: 1),
          )),
    );
  }
}
