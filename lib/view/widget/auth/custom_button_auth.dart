import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String textbtn;
  final void Function() onPressed;
  const CustomButtonAuth({
    Key? key,
    required this.textbtn,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: AppColor.primaryColor,
        textColor: AppColor.backgroundcolor,
        onPressed: onPressed,
        child: Text(textbtn),
      ),
    );
  }
}
