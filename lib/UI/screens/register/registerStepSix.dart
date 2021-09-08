import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStepSixScreen extends StatefulWidget {
  @override
  _RegisterStepSixScreenState createState() => _RegisterStepSixScreenState();
}

class _RegisterStepSixScreenState extends State<RegisterStepSixScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                      AppImages.appLogo,
                      width: 106,
                      height: 56,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 4),
                    Center(
                        child: Image.asset(AppImages.appConfirmRegistration)),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'تم التسجيل بنجاح',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Get.offAll(LoginScreen());
                      },
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'سجل دخول الان',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
