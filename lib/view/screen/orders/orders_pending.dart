import 'package:e_commerce_app/controller/orders/orders_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/order/custom_pending_order.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    // OrdersControllerImp controller =
    Get.put(OrdersControllerImp());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Orders Pending'),
            centerTitle: true,
          ),
          body: GetBuilder<OrdersControllerImp>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    ...List.generate(controller.orderPending.length, (index) {
                      return CustomCardPendingOrder(
                          ordersModel: controller.orderPending[index]);
                    })
                  ],
                ),
              ),
            );
          })),
    );
  }
}
