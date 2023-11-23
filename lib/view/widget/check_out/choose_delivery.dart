import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/color.dart';

class ChooseDelivery extends StatelessWidget {
  final String titleDelivery;
  final bool isActive;
  final String imageBath;
  final void Function() onTap;
  const ChooseDelivery({
    Key? key,
    required this.titleDelivery,
    required this.isActive,
    required this.imageBath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            color: isActive ? AppColor.primaryColor : AppColor.backgroundcolor,
            border: Border.all(color: AppColor.primaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageBath,
              width: 70,
              height: 70,
            ),
            const SizedBox(height: 8),
            Text(
              titleDelivery,
              style: TextStyle(
                  color: isActive
                      ? AppColor.backgroundcolor
                      : AppColor.primaryColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
