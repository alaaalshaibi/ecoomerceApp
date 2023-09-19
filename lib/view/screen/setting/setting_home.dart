import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/setting/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return ListView(
      children: [
        Center(
          child: IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.logout)),
        ),
      ],
    );
  }
}
