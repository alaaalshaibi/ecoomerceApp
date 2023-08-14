import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  final String titleText;
  const CustomTitleAuth({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
