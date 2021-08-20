import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/UI/screens/register/registerStepOne.dart';
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
      theme: ThemeData(
        fontFamily: 'GESSTWO',
      ),
      home: LoginScreen(),
    );
  }
}
