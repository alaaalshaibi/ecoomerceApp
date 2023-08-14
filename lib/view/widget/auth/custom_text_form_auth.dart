import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String textLabel;
  final String hintText;
  final IconData suffixIcon;
  final TextEditingController txtController;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? suffixOnPressed;
  const CustomTextFormAuth({
    Key? key,
    required this.textLabel,
    required this.hintText,
    required this.suffixIcon,
    required this.txtController,
    required this.validator,
    this.keyboardType,
    this.obscureText,
    this.suffixOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == false ? true : false,
      keyboardType: keyboardType,
      validator: validator,
      controller: txtController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        suffixIcon: InkWell(onTap: suffixOnPressed, child: Icon(suffixIcon)),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(textLabel)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
