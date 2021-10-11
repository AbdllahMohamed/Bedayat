import 'package:bedayat/UI/screens/add_child/add_child_step_five.dart';
import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/register/register_step_six.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_Controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SuccessCheckout extends StatefulWidget {
  final String routeName;

  SuccessCheckout({
    required this.routeName,
    Key? key,
  }) : super(key: key);

  @override
  _SuccessCheckoutState createState() => _SuccessCheckoutState();
}

class _SuccessCheckoutState extends State<SuccessCheckout> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _navigateTo();
  }

  _navigateTo() {
    if (widget.routeName == 'register') {
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(RegisterStepSixScreen());
      });
    } else if (widget.routeName == 'home') {
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(BottomNavigationWidget());
      });
    } else {
      Get.offAll(AddChildStepFiveScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          Image.asset(
            AppImages.appLogo,
            width: 106,
            height: 56,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 5),
          Center(
            child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.white,
                )),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Payment completed successfull'.tr,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Payment in progress...'.tr,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.accentColor,
                fontWeight: FontWeight.w200,
              ),
            ),
          )
        ],
      ),
    );
  }
}
