import 'package:e_commerce_app/controller/orders/orders_archive_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/order/custom_archive_order.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderArchiveControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders Archive'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrderArchiveControllerImp>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                ...List.generate(
                    controller.listOrderArchive.length,
                    (index) => CustomCardArchiveOrder(
                          ordersModel: controller.listOrderArchive[index],
                        ))
              ]),
            );
          }),
        ),
      ),
    );
  }
}
