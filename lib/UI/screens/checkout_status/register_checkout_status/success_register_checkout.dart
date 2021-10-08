import 'package:bedayat/UI/screens/register/register_step_six.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SuccessRegisterCheckout extends StatefulWidget {
  SuccessRegisterCheckout({
    Key? key,
  }) : super(key: key);

  @override
  _SuccessRegisterCheckoutState createState() =>
      _SuccessRegisterCheckoutState();
}

class _SuccessRegisterCheckoutState extends State<SuccessRegisterCheckout> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _navigateTo();
  }

  _navigateTo() {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(RegisterStepSixScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
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
      ),
    );
  }
}
