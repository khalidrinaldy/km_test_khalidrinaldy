import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/modules/controller/ListUserPageController.dart';

class ListUserPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListUserPageController>(() => ListUserPageController());
  }
}
