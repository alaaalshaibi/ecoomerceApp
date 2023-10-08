import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/constant/color.dart';

class CustomTextCheckOut extends StatelessWidget {
  final String textF;
  final String textL;
  final Color? color;
  const CustomTextCheckOut({
    Key? key,
    required this.textF,
    required this.textL,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textF,
          style: TextStyle(fontSize: 18, color: color ?? AppColor.black),
        ),
        Text(
          textL,
          style: TextStyle(fontSize: 18, color: color ?? AppColor.black),
        ),
      ],
    );
  }
}
