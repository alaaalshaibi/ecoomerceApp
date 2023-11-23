import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/image_assets.dart';

import '../../../controller/check_out/check_out_controller.dart';
import '../../widget/check_out/choose_address_shipping.dart';
import '../../widget/check_out/choose_delivery.dart';
import '../../widget/check_out/choose_payment.dart';
import '../../widget/check_out/title_check_out.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutControllerImp controller = Get.put(CheckOutControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('CheckOut'),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              controller.orderAdd();
            },
            color: AppColor.primaryColor,
            child: const Text(
              'CheckOut',
              style: TextStyle(
                  color: AppColor.backgroundcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        body: GetBuilder<CheckOutControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(children: [
                const TitleCheckOut(
                  titleCheckOut: 'Choose Payment Method',
                ),
                const SizedBox(height: 10),
                ChoosePaymentMethod(
                  methodPayment: 'Cash Payment',
                  isActive: controller.paymentValue == 'cash' ? true : false,
                  onTap: () {
                    controller.choosePayment('cash');
                  },
                ),
                const SizedBox(height: 10),
                ChoosePaymentMethod(
                  methodPayment: 'Card Payment',
                  isActive: controller.paymentValue == 'card' ? true : false,
                  onTap: () {
                    controller.choosePayment('card');
                  },
                ),
                const SizedBox(height: 20),
                const TitleCheckOut(titleCheckOut: 'Choose Delivery Type'),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ChooseDelivery(
                        titleDelivery: 'Delivery',
                        isActive: controller.deliveryValue == 'delivery'
                            ? true
                            : false,
                        imageBath: AppImageAssets.delivery,
                        onTap: () {
                          controller.chooseDelivery('delivery');
                        },
                      ),
                      const SizedBox(width: 10),
                      ChooseDelivery(
                        titleDelivery: 'Drive Thru',
                        isActive: controller.deliveryValue == 'driveThru'
                            ? true
                            : false,
                        imageBath: AppImageAssets.driveThru,
                        onTap: () {
                          controller.chooseDelivery('driveThru');
                        },
                      ),
                    ],
                  ),
                ),
                if (controller.deliveryValue == 'delivery')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const TitleCheckOut(titleCheckOut: 'Shipping Address'),
                      const SizedBox(height: 10),
                      ...List.generate(
                          controller.listAddressViewData.length,
                          (index) => ChooseAddress(
                                title:
                                    "${controller.listAddressViewData[index].addressName}",
                                subTitle:
                                    "${controller.listAddressViewData[index].addressCity}",
                                onTap: () {
                                  controller.chooseShipping(
                                      "${controller.listAddressViewData[index].addressId}");
                                },
                                isActive: controller.addressId ==
                                        "${controller.listAddressViewData[index].addressId}"
                                    ? true
                                    : false,
                              ))
                    ],
                  )
              ]),
            ),
          );
        }),
      ),
    );
  }
}
