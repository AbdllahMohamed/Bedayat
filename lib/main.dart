import 'package:bedayat/UI/screens/register/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bedayat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GESSTWO',
      ),
      home: RegisterScreen(),
    );
  }
}
