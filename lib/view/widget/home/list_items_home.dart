import 'package:e_commerce_app/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_link.dart';
import '../../../data/model/items_model.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ItemsHome(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 150,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              width: 150,
              height: 140,
              // color: Colors.amber,
              child: Image.network(
                "${AppLink.imageItems}/${itemsModel.itemsImage}",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text("${itemsModel.categoriesName}"),
      ],
    );
  }
}
