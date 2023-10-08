import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/cart/app_bar_cart.dart';
import '../../widget/cart/custom_bottom_cart.dart';
import '../../widget/cart/custom_cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CartControllerImp cartController =
    Get.put(CartControllerImp());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartControllerImp>(builder: (controller) {
        return CustomBottomCart(
          countTotal: "${controller.countTotal}",
          totalPriceOrder: "${controller.totalPriceOrder} \$",
          shipping: '20 \$',
          total: '2000 \$',
        );
      }),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const CustomAppBarCart(),
          GetBuilder<CartControllerImp>(builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      ...List.generate(
                          controller.cartList.length,
                          (index) => CustomCartItems(
                                nameItem:
                                    "${controller.cartList[index].itemsName}",
                                priceItem:
                                    "${controller.cartList[index].totalItemsPrice}",
                                countItem:
                                    controller.cartList[index].itemsCountCart!,
                                imageName:
                                    "${controller.cartList[index].itemsImage}",
                                onPressedAdd: () async {
                                  await controller.addCart(
                                      controller.cartList[index].itemsId!);
                                  controller.refreshPage();
                                },
                                onPressedRemove: () async {
                                  await controller.removeCart(
                                      controller.cartList[index].itemsId!);
                                  controller.refreshPage();
                                },
                              ))
                    ],
                  ),
                ));
          })
        ],
      ),
    );
  }
}
