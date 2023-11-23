import 'dart:io';

import 'package:get/get.dart';

// Future<bool>
bool alertExitApp(bool value) {
  Get.defaultDialog(
    title: 'Alert',
    middleText: 'Do you want to exit the application',
    onConfirm: () => exit(0),
    onCancel: () => Get.back(),
  );
  return false;
  // Future.value(true);
}
