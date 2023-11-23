import 'package:e_commerce_app/controller/orders/orders_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../constant/routes_name.dart';

requestPermissionFcmConfig<NotificationSettings>() async {
  // NotificationSettings settings =
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(
        remoteMessage.notification!.title!, remoteMessage.notification!.body!);
    refreshOrderPending(remoteMessage.data);
  });
}

void refreshOrderPending(data) {
  if (Get.currentRoute == AppRoute.ordersPending &&
      data['pagename'] == 'refreshOrderPending') {
    OrdersControllerImp ordersControllerImp = Get.find();
    ordersControllerImp.refreshOrderPending();
  }
}
