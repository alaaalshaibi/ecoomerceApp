import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class NotificationData {
  Crud crud;
  NotificationData({
    required this.crud,
  });
  getNotificationData({required String userId}) async {
    var response = await crud
        .postData(AppLink.viewNotification, {"notification_user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
