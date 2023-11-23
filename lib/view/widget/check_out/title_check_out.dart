import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TitleCheckOut extends StatelessWidget {
  final String titleCheckOut;
  const TitleCheckOut({
    super.key,
    required this.titleCheckOut,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titleCheckOut,
      style: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16),
    );
  }
}
