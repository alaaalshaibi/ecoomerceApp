import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ChooseAddress extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function() onTap;
  final bool isActive;
  const ChooseAddress({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: isActive ? AppColor.primaryColor : AppColor.primarySoundColor,
        child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                  color: isActive
                      ? AppColor.backgroundcolor
                      : AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                  color: isActive
                      ? AppColor.backgroundcolor
                      : AppColor.primaryColor,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
