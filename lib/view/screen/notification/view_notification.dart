import 'package:e_commerce_app/controller/notification/notification_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewNotification extends GetView<NotificationControllerImp> {
  const ViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    // NotificationControllerImp controller =
    // Get.put(NotificationControllerImp());
    Get.lazyPut(() => NotificationControllerImp());
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(color: AppColor.primaryColor),
          child: const Center(
              child: Text(
            'Notifications',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
        ),
        GetBuilder<NotificationControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    ...List.generate(
                        controller.listNotification.length,
                        (index) => Card(
                              child: ListTile(
                                leading: ClipRRect(
                                  child: Image.asset(AppImageAssets.avatar),
                                ),
                                title: Text(
                                    "${controller.listNotification[index].notificationTitle}"),
                                subtitle: Text(
                                    "${controller.listNotification[index].notificationBody}"),
                                trailing: Text(
                                    '${controller.listNotification[index].notificationDateTime}'),
                              ),
                            ))
                  ],
                )))
      ],
    );
  }
}
