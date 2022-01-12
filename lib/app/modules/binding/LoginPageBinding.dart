import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/modules/controller/LoginPageController.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
