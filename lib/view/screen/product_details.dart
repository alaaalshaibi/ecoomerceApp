import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:e_commerce_app/view/widget/product_details/top_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../widget/product_details/price_and_quantity.dart';
import '../widget/product_details/sub_items.dart';

class ProductDetailsScreen extends GetView<ProductDetailsControllerImp> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.primaryColor),
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "Add To Card",
            style: TextStyle(color: AppColor.backgroundcolor, fontSize: 20),
          ),
        ),
      ),
      body: ListView(children: [
        const TopProductDetails(),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.itemsModel.itemsName}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColor.primaryColor),
              ),
              const SizedBox(height: 10),
              PriceAndQuantity(
                price: '',
                quantity: '',
                onPressedAdd: () {},
                onPressedRemove: () {},
              ),
              const SizedBox(height: 10),
              Text(
                  "${controller.itemsModel.itemsDescription}${controller.itemsModel.itemsDescription}${controller.itemsModel.itemsDescription}${controller.itemsModel.itemsDescription}${controller.itemsModel.itemsDescription}${controller.itemsModel.itemsDescription}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColor.black)),
              const SizedBox(height: 10),
              Text(
                "Color",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColor.primaryColor),
              ),
              const SizedBox(height: 10),
              const SubItems(),
              const SizedBox(height: 15),
            ],
          ),
        )
      ]),
    );
  }
}
