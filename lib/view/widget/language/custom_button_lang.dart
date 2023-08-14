import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function() onPressed;
  const CustomButtonLang({
    super.key,
    required this.textButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      margin: const EdgeInsets.only(bottom: 10),
      color: AppColor.primaryColor,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
