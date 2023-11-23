import 'package:e_commerce_app/controller/orders/order_details_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: GetBuilder<OrderDetailsControllerImp>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Table(
                          // border: TableBorder.all(),
                          children: [
                            const TableRow(children: [
                              Text(
                                'Items Name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Items QTY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Items Price',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            ...List.generate(
                              controller.listOrderDetails.length,
                              (index) => TableRow(children: [
                                Text(
                                    '${controller.listOrderDetails[index].itemsName}',
                                    textAlign: TextAlign.center),
                                Text(
                                    '${controller.listOrderDetails[index].itemsCountCart}',
                                    textAlign: TextAlign.center),
                                Text(
                                    '${controller.listOrderDetails[index].totalItemsPrice}',
                                    textAlign: TextAlign.center),
                              ]),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Total Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor),
                            ),
                            Text('${controller.ordersModel.ordersTotalPrice}')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (controller.ordersModel.ordersAddress != '0')
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shipping Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor),
                          ),
                          const SizedBox(height: 10),
                          Text('${controller.ordersModel.addressName}'),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                if (controller.ordersModel.ordersAddress != '0')
                  Card(
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      padding: const EdgeInsets.all(12),
                      child: GoogleMap(
                        markers: controller.marker.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition,
                        onMapCreated: (GoogleMapController controllerMap) {
                          if (!controller.controllerMap.isCompleted) {
                            controller.controllerMap.complete(controllerMap);
                          } else {}
                          // controllerImp.controllerMap.complete(controller);
                        },
                      ),
                    ),
                  )
              ]),
            );
          })),
    );
  }
}
