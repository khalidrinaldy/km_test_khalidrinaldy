// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/modules/controller/ListUserPageController.dart';
import 'package:km_test_khalidrinaldy/app/modules/controller/LoginPageController.dart';

class ListUserPageView extends StatefulWidget {
  const ListUserPageView({Key? key}) : super(key: key);

  @override
  _ListUserPageViewState createState() => _ListUserPageViewState();
}

class _ListUserPageViewState extends State<ListUserPageView> {
  final listUserController = Get.find<ListUserPageController>();
  final loginController = Get.find<LoginPageController>();

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
          "Third Screen",
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
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(left: 12),
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white,
              child: Obx(
                () => listUserController.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xFF2B637B),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => listUserController.refreshData(),
                        child: Obx(
                          () => ListView.builder(
                            itemCount: listUserController.users.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  loginController.selectedName = listUserController.users.elementAt(index).firstName.toString() +
                                      " " + listUserController.users.elementAt(index).lastName.toString();
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 24),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFFE2E3E4),
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            listUserController.users.elementAt(index).avatar.toString(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${listUserController.users.elementAt(index).firstName.toString()} ${listUserController.users.elementAt(index).lastName.toString()}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF04021D),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            listUserController.users.elementAt(index).email.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF686777),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
