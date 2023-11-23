import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/user_key.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/data/datasource/remote/offers.dart';
import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

import '../../core/constant/routes_name.dart';
import '../items/search.dart';

abstract class OffersController extends SearchControllerImp {
  // This method is responsible for fetching the offers data and updating the UI.
  getOffersView();
  @override
  goToProductDetails(ItemsModel itemsModel);
}

class OffersControllerImp extends OffersController {
  // Services class is used to access shared preferences.

  // OffersData class is used to fetch offers data from the server.
  OffersData offersData = OffersData(crud: Get.find());

  // List of ItemsModel to store the fetched offers data.
  List<ItemsModel> listItemsOffers = [];

  // StatusRequest variable to store the status of the request.

  @override
  getOffersView() async {
    // Clear the list before fetching new data.
    listItemsOffers.clear();

    // Set the status to loading.
    statusRequest = StatusRequest.loading;

    // Fetch the offers data from the server.
    var response = await offersData.getData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!);

    // Handle the status of the request.
    statusRequest = handlingStatusRequest(response);

    // If the request is successful, parse the response data and add it to the list.
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        listItemsOffers.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    // Update the UI.
    update();
  }

  @override
  void onInit() {
    // Call the getOffersView method when the controller is initialized.
    getOffersView();
    super.onInit();
  }

  @override
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetailsScreen,
        arguments: {"itemsModel": itemsModel});
  }
}
//
//This code provides a GetX controller that fetches offers data from the server and updates the UI accordingly. The `getOffersView` method is responsible for fetching the data and updating the UI. The `OffersData` class is used to fetch the offers data from the server. The `listItemsOffers` list stores the fetched offers data. The `statusRequest` variable stores the status of the request. The `onInit` method calls the `getOffersView` method when the controller is initialized..</s>