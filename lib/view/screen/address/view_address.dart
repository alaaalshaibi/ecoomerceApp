import 'package:e_commerce_app/controller/address/view_address_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressControllerImp());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Get.toNamed(AppRoute.addMapAddress);
            }),
        appBar: AppBar(
          title: const Text('Address'),
          centerTitle: true,
        ),
        body: GetBuilder<ViewAddressControllerImp>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const SizedBox(height: 15),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listAddressViewData.length,
                    itemBuilder: (context, index) {
                      return CardAddressView(
                        onPressed: () {
                          controller.deleteAddress(
                              controller.listAddressViewData[index].addressId!);
                        },
                        addressModel: controller.listAddressViewData[index],
                      );
                    },
                  ),
                ],
              ));
        }),
      ),
    );
  }
}

class CardAddressView extends StatelessWidget {
  final AddressModel addressModel;
  final void Function() onPressed;
  const CardAddressView({
    super.key,
    required this.addressModel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${addressModel.addressName}"),
        subtitle: Row(
          children: [
            Text("City name :${addressModel.addressCity}"),
            const SizedBox(width: 15),
            Text("Street name : ${addressModel.addressStreet}"),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
