import 'package:e_commerce_app/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/user_key.dart';
import '../../core/functions/handling_status_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/notification_model.dart';

abstract class NotificationController extends GetxController {
  getViewNotification();
}

class NotificationControllerImp extends NotificationController {
  NotificationData notificationData = NotificationData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<NotificationModel> listNotification = [];

  @override
  getViewNotification() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.getNotificationData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        listNotification
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getViewNotification();
    super.onInit();
  }
}
