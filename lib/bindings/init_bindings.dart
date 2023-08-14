import 'package:e_commerce_app/core/class/crud.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
