import 'package:bedayat/UI/events/events.dart';
import 'package:bedayat/UI/screens/home/home.dart';
import 'package:bedayat/UI/screens/onboarding/onboarding.dart';
import 'package:bedayat/UI/screens/report/report.dart';
import 'package:bedayat/controllers/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI/screens/bottom_navigation/bottom_navigation.dart';

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
      ),
      home: EventsScreen(),
    );
  }
}
