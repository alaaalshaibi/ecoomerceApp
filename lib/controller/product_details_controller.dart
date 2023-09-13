import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  List subItems = [
    {"name": "Red", "id": 1, "isActive": 0},
    {"name": "Blue", "id": 2, "isActive": 1},
    {"name": "Black", "id": 3, "isActive": 0},
  ];
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    itemsModel = Get.arguments["itemsModel"];
  }
}
