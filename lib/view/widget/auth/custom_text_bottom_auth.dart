import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextBottomAuth extends StatelessWidget {
  final String fText;
  final String lText;
  final void Function() onTap;
  const CustomTextBottomAuth({
    super.key,
    required this.fText,
    required this.lText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(fText),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            lText,
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
