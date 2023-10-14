import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/user_key.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/address_data.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class ViewAddressController extends GetxController {
  viewAddressData();
  deleteAddress(String addressId);
}

class ViewAddressControllerImp extends ViewAddressController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(crud: Get.find());
  List<AddressModel> listAddressViewData = [];

  @override
  viewAddressData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddressData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        listAddressViewData
            .addAll(responseData.map((e) => AddressModel.fromJson(e)));
      }
      // else if (response['status'] == 'failure') {
      //   statusRequest = StatusRequest.failure;
      // }
      if (listAddressViewData.isEmpty) {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  deleteAddress(String addressId) async {
    var response = await addressData.removeAddressData(
      userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
      addressId: addressId.toString(),
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        listAddressViewData
            .removeWhere((element) => element.addressId == addressId);
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    viewAddressData();
    super.onInit();
  }
}
