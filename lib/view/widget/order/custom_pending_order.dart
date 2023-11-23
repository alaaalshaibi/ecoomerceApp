import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/orders_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes_name.dart';
import '../../../data/model/orders_model.dart';

class CustomCardPendingOrder extends GetView<OrdersControllerImp> {
  final OrdersModel ordersModel;
  const CustomCardPendingOrder({
    super.key,
    required this.ordersModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Order Number:',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text("#  ${ordersModel.ordersId}",
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(
                  Jiffy.parse(ordersModel.ordersDateTime!).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Order Type:'),
                Text('${controller.changeOrderType(ordersModel.ordersType!)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Order Price:'),
                Text('${ordersModel.ordersPrice}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('order Price Delivery:'),
                Text('${ordersModel.ordersPriceDelivery}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Order Payment Method:'),
                Text(
                    '${controller.changePaymentMethodType(ordersModel.ordersPaymentType!)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Order Status :'),
                Text(
                    '${controller.changeMethodStatus(ordersModel.ordersStatus!)}'),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Total Price: ${ordersModel.ordersTotalPrice} \$",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                ),
                MaterialButton(
                  minWidth: 50,
                  color: AppColor.primarySoundColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.orderDetails,
                        arguments: {"ordersModel": ordersModel});
                  },
                  child: const Text(
                    'Details',
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
                if (ordersModel.ordersStatus == '0')
                  MaterialButton(
                    minWidth: 50,
                    color: AppColor.primarySoundColor,
                    onPressed: () {
                      controller.deleteOrder(ordersModel.ordersId!);
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
