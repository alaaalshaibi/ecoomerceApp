import 'package:e_commerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImageAssets.logo1,
      width: double.infinity,
      height: 130,
    );
  }
}
