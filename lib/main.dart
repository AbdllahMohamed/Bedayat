import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/controllers/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'UI/screens/register/register_step_five.dart';

var token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  final box = GetStorage();
  var token = box.read('token');

  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final token;
  MyApp({this.token});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bedayat',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'GESSTWO',
        colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
      ),
      //home: token != null ? BottomNavigationWidget() : LoginScreen(),
      home: RegisterStepFiveScreen(),
    );
  }
}
