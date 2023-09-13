import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String titleHome;
  const CustomTitleHome({
    super.key,
    required this.titleHome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        titleHome,
        style: const TextStyle(
            fontSize: 18,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
