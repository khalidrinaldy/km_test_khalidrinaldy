import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/modules/binding/ListUserPageBinding.dart';
import 'package:km_test_khalidrinaldy/app/modules/binding/LoginPageBinding.dart';
import 'package:km_test_khalidrinaldy/app/modules/view/page/ConfirmationPageView.dart';
import 'package:km_test_khalidrinaldy/app/modules/view/page/ListUserPageView.dart';
import 'package:km_test_khalidrinaldy/app/modules/view/page/LoginPageView.dart';
import 'package:km_test_khalidrinaldy/app/router/RouterPage.dart';

class AppRoutes {
  static final pages = <GetPage<dynamic>>[
    GetPage(name: LoginPageViewRoute, page: ()=>LoginPageView(), binding: LoginPageBinding()),
    GetPage(name: ConfirmationPageViewRoute, page: ()=>ConfirmationPageView(), binding: LoginPageBinding()),
    GetPage(name: ListUserPageViewRoute, page: ()=>ListUserPageView(), bindings: [LoginPageBinding(), ListUserPageBinding()]),
  ];
}