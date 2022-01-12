// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/modules/controller/LoginPageController.dart';
import 'package:km_test_khalidrinaldy/app/router/RouterPage.dart';
import 'package:km_test_khalidrinaldy/app/widgets/Button.dart';
import 'package:km_test_khalidrinaldy/app/widgets/Dialog.dart';
import 'package:km_test_khalidrinaldy/app/widgets/Input.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Obx(
            () => controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xFF2B637B),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Image.asset(
                            "assets/btn_add_photo.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 45,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                              child: Input(
                                data: controller.name,
                                onChanged: (value) => controller.name = value,
                                hintText: "Name",
                              )),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 45,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                              child: Input(
                                data: controller.palindrome,
                                onChanged: (value) => controller.palindrome = value,
                                hintText: "Palindrome",
                              )),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.palindrome.length > 0) {
                                controller.checkPalindrome();
                                Get.back();
                                if (controller.isPalindrome) {
                                  Get.dialog(
                                    BasicDialog(
                                      title: "Palindrome Check : Success",
                                      content: "Now you can go next",
                                    ),
                                  );
                                } else {
                                  Get.dialog(
                                    BasicDialog(
                                      title: "Palindrome Check : Failed",
                                      content: "Please fill with another word",
                                    ),
                                  );
                                }
                              } else {
                                controller.isPalindrome = false;
                                Get.back();
                                Get.dialog(
                                  BasicDialog(
                                    title: "Palindrome Check : Failed",
                                    content: "Please fill palindrome form",
                                  ),
                                );
                              }
                            },
                            style: basicButtonStyle(),
                            child: Text(
                              "CHECK",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (!controller.isPalindrome || controller.name.isEmpty) {
                                Get.back();
                                Get.dialog(
                                  BasicDialog(
                                    title: "Submit Failed",
                                    content: "Please check name form or check palindrome first",
                                  ),
                                );
                              } else {
                                controller.isLoading = true;
                                Timer(Duration(milliseconds: 1500), () {
                                  controller.isLoading = false;
                                  Get.toNamed(ConfirmationPageViewRoute);
                                });
                              }
                            },
                            style: basicButtonStyle(),
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
