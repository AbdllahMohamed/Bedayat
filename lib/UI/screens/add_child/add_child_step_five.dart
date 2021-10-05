import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/home/home.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChildStepFiveScreen extends StatefulWidget {
  @override
  _AddChildStepFiveScreenState createState() => _AddChildStepFiveScreenState();
}

class _AddChildStepFiveScreenState extends State<AddChildStepFiveScreen> {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اضافة طفل',
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
                              '5/5',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 4),
                    Center(
                        child: Image.asset(AppImages.appConfirmRegistration)),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'تم اضافة طفل بنجاح',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Get.offAll(BottomNavigationWidget());
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
                            'قم بفحصه الان',
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
