// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/modules/controller/LoginPageController.dart';
import 'package:km_test_khalidrinaldy/app/router/RouterPage.dart';
import 'package:km_test_khalidrinaldy/app/widgets/Button.dart';

class ConfirmationPageView extends GetView<LoginPageController> {
  const ConfirmationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Color(0xFF554AF0),
              size: 40,
            ),
          ),
        ),
        title: Text(
          "Second Screen",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF04021D),
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.black.withOpacity(0.1),
            height: 0.5,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFF0000).withOpacity(0.1),
          ),
          Align(
            child: Container(
              padding: EdgeInsets.only(left: 12),
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Color(0xFF04021D),
                      fontSize: 12,
                    ),
                  ),
                  Obx(() => Text(
                        controller.name,
                        style: TextStyle(
                          color: Color(0xFF04021D),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(ListUserPageViewRoute);
                        },
                        style: basicButtonStyle(),
                        child: Text(
                          "Choose a User",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Center(
              child: Text(
                controller.selectedName.isEmpty ? "Selected User Name" : controller.selectedName,
                style: TextStyle(
                  color: Color(0xFF04021D),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
