import 'package:flutter/material.dart';

import 'package:e_commerce_app/app_link.dart';

import '../../../core/constant/color.dart';

class CustomCartItems extends StatelessWidget {
  final String nameItem;
  final String priceItem;
  final String countItem;
  final String imageName;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  const CustomCartItems({
    Key? key,
    required this.nameItem,
    required this.priceItem,
    required this.countItem,
    required this.imageName,
    required this.onPressedAdd,
    required this.onPressedRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                  height: 100,
                  child: Image.network(
                    "${AppLink.imageItems}/$imageName",
                    fit: BoxFit.fill,
                  ))),
          Expanded(
              flex: 4,
              child: ListTile(
                title: Text(nameItem),
                subtitle: Text(
                  priceItem,
                  style: const TextStyle(
                      color: AppColor.primaryColor, fontSize: 17),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 40,
                child: IconButton(
                    onPressed: onPressedAdd, icon: const Icon(Icons.add)),
              ),
              SizedBox(
                height: 30,
                child: Text(countItem,
                    style: const TextStyle(
                        color: AppColor.primaryColor, fontSize: 20)),
              ),
              SizedBox(
                  height: 30,
                  child: IconButton(
                      onPressed: onPressedRemove,
                      icon: const Icon(Icons.remove))),
            ],
          )),
        ],
      ),
    );
  }
}
