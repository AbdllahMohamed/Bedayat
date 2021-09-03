import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bedayat/UI/screens/register/registerStepThree.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';

class RegisterStepTwoScreen extends StatefulWidget {
  final String phoneController;
  final String emailController;
  final String passwordController;

  RegisterStepTwoScreen({
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  _RegisterStepTwoScreenState createState() => _RegisterStepTwoScreenState();
}

class _RegisterStepTwoScreenState extends State<RegisterStepTwoScreen> {
  String location = "3.14";

  registerStepTwo() async {
    if (location == '') {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: 'يجب اختيار الموقع');
      return;
    } else {
      Get.to(RegisterStepThreeScreen(
        phoneController: widget.phoneController,
        emailController: widget.emailController,
        passwordController: widget.passwordController,
        location: location,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    AppImages.appSubLogo,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'التسجيل',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 6,
                            color: AppColors.accentColor,
                          ),
                        ),
                        child: Text(
                          '2/5',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'اختر موقع عملك او موقع السكن الخاص بك',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(AppImages.appMap),
                  SizedBox(height: 15),
                  ActionButton(
                      label: 'التالى',
                      onPressed: () async {
                        registerStepTwo();
                      }),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
