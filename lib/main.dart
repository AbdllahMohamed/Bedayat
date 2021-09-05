import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/controllers/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bedayat',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: ThemeData(
        fontFamily: 'GESSTWO',
        colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
      ),
      home: LoginScreen(),
    );
  }
}
