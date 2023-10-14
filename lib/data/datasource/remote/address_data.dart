import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class AddressData {
  Crud crud;
  AddressData({
    required this.crud,
  });
  addAddressData({
    required String userId,
    required String addressName,
    required String addressCity,
    required String addressStreet,
    required String addressLat,
    required String addressLang,
  }) async {
    var response = await crud.postData(AppLink.addAddress, {
      "address_user_id": userId,
      "address_name": addressName,
      "address_city": addressCity,
      "address_street": addressStreet,
      "address_lat": addressLat,
      "address_lang": addressLang,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeAddressData({
    required String userId,
    required String addressId,
  }) async {
    var response = await crud.postData(AppLink.removeAddress, {
      "address_user_id": userId,
      "address_id": addressId,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewAddressData({
    required String userId,
  }) async {
    var response = await crud.postData(AppLink.viewAddress, {
      "address_user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateAddressData({
    required String userId,
    required String addressId,
    required String addressName,
    required String addressCity,
    required String addressStreet,
    required String addressLat,
    required String addressLang,
  }) async {
    var response = await crud.postData(AppLink.editAddress, {
      "address_user_id": userId,
      "address_id": addressId,
      "address_name": addressName,
      "address_city": addressCity,
      "address_street": addressStreet,
      "address_lat": addressLat,
      "address_lang": addressLang,
    });
    return response.fold((l) => l, (r) => r);
  }
}
