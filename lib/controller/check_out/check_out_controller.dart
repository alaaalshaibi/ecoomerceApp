import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/constant/user_key.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/address_data.dart';
import 'package:e_commerce_app/data/datasource/remote/check_out.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class CheckOutController extends GetxController {
  viewAddressShipping();
  choosePayment(String value);
  chooseDelivery(String value);
  chooseShipping(String value);
  orderAdd();
}

class CheckOutControllerImp extends CheckOutController {
  CheckOutData checkOutData = CheckOutData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(crud: Get.find());
  List<AddressModel> listAddressViewData = [];
  String paymentValue = 'cash';
  String deliveryValue = 'delivery';
  String addressId = '0';
  late String couponId;
  late String priceOrder;
  late String discountCoupon;
  String? orderType;
  String? paymentType;
  @override
  viewAddressShipping() async {
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
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    priceOrder = Get.arguments['priceOrder'];
    discountCoupon = Get.arguments['discountCoupon'].toString();
    viewAddressShipping();
    super.onInit();
  }

  @override
  chooseDelivery(String value) {
    deliveryValue = value;
    if (deliveryValue == "delivery") {
      orderType = '0';
    } else {
      orderType = '1';
    }
    update();
  }

  @override
  choosePayment(String value) {
    paymentValue = value;
    if (paymentValue == "cash") {
      paymentType = '0';
    } else {
      paymentType = '1';
    }
    update();
  }

  @override
  chooseShipping(String value) {
    if (deliveryValue == 'delivery') {
      addressId = value;
    } else {
      addressId = '0';
    }
    update();
  }

  @override
  orderAdd() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkOutData.orderAddData(
      userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
      userAddress: addressId.toString(),
      orderType: orderType.toString(),
      orderPriceDelivery: '10',
      orderPrice: priceOrder.toString(),
      orderCoupon: couponId.toString(),
      orderPaymentType: paymentType.toString(),
      discountCoupon: discountCoupon.toString(),
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar('success', 'the order successfully');
        Get.offAllNamed(AppRoute.homePage);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar('Alert', 'try again');
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
