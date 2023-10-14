import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/address_controller.dart';
import '../../../core/functions/validator_input.dart';
import '../../../core/localization/app_text_lang.dart';

class AddDetailsAddress extends StatelessWidget {
  const AddDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    // AddressControllerImp controller =
    Get.put(AddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Details Address'),
        centerTitle: true,
      ),
      body: GetBuilder<AddressControllerImp>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.keyForm,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                const SizedBox(height: 20),
                CustomTextFormAuth(
                    textLabel: "Name Address ",
                    hintText: "Enter name address",
                    suffixIcon: Icons.near_me_rounded,
                    txtController: controller.name,
                    validator: (value) {
                      return validatorInput(value!, 3, 20, AppLang.userName);
                    }),
                const SizedBox(height: 20),
                CustomTextFormAuth(
                    textLabel: "City Address ",
                    hintText: "Enter city address",
                    suffixIcon: Icons.location_city_outlined,
                    txtController: controller.city,
                    validator: (value) {
                      return validatorInput(value!, 3, 20, AppLang.userName);
                    }),
                const SizedBox(height: 20),
                CustomTextFormAuth(
                    textLabel: "Street Address ",
                    hintText: "Enter street address",
                    suffixIcon: Icons.streetview,
                    txtController: controller.street,
                    validator: (value) {
                      return validatorInput(value!, 3, 20, AppLang.userName);
                    }),
                const SizedBox(height: 20),
                CustomButtonAuth(
                    textbtn: "Add Address",
                    onPressed: () {
                      controller.addAddress();
                    })
              ]),
            ),
          ),
        );
      }),
    );
  }
}
