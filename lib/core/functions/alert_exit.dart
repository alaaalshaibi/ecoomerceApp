import 'dart:io';

import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: 'Alert',
    middleText: 'Do you want to exit the application',
    onConfirm: () => exit(0),
    onCancel: () => Get.back(),
  );
  return Future.value(true);
}
