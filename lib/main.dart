import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_khalidrinaldy/app/router/RouterApp.dart';
import 'package:km_test_khalidrinaldy/app/router/RouterPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.pages,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: LoginPageViewRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
