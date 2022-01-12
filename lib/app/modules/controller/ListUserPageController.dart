// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/data/models/User.dart';
import 'package:km_test_khalidrinaldy/app/data/provider/ApiProvider.dart';

class ListUserPageController extends GetxController {
  final apiProvider = ApiProvider();
  RxList<User> _users = <User>[].obs;
  RxBool _isLoading = false.obs;

  List<User> get users => _users.value;
  bool get isLoading => _isLoading.value;

  set users(List<User> users) => _users.value = users;
  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading = true;
    final res = await apiProvider.getUser(pageNumber: 1);
    final res2 = await apiProvider.getUser(pageNumber: 2);
    final userJson = jsonDecode(res)['data'] as List;
    final userJson2 = jsonDecode(res2)['data'] as List;
    users.addAll(userJson.map((userJs) => User.fromJson(userJs)).toList());
    users.addAll(userJson2.map((userJs) => User.fromJson(userJs)).toList());
    isLoading = false;
  }

  Future<void> refreshData() async {
    users.clear();
    await Future.delayed(Duration(seconds: 2));
    fetchUsers();
  }
}