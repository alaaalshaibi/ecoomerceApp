import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  final String? titleBtn;
  final IconData iconBtn;
  final void Function()? onPressedBtn;

  final bool isActive;
  const CustomBottomAppBarHome({
    super.key,
    this.titleBtn,
    required this.iconBtn,
    required this.onPressedBtn,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // color: isActive ? AppColor.primaryColor : isSelectedBtn,
      onPressed: onPressedBtn,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconBtn,
            color: isActive ? AppColor.primaryColor : AppColor.black,
          ),
          // Text(
          //   titleBtn,
          //   style: TextStyle(
          //       color: isActive ? AppColor.primaryColor : AppColor.black),
          // )
        ],
      ),
    );
  }
}
