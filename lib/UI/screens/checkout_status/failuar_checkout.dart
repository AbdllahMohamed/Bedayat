import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/payment/payment.dart';
import 'package:bedayat/UI/screens/payment_web_view/payment_web_view.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class FailuarCheckout extends StatelessWidget {
  final String routeName;

  FailuarCheckout({required this.routeName});
  final PaymentController paymentController = Get.put(PaymentController());
  _registerRetryPayment() async {
    String error = await paymentController.getCheckoutId(
        packageId: selectedPackageIndex.toString(),
        email: '"${GetStorage().read('userEmail')}"',
        street: streetController.text,
        city: cityController.text,
        state: stateController.text,
        postcode: postCodeController.text,
        givenName: givenNameController.text,
        surname: surnameController.text,
        paymentMethod: seletctedBank,
        startAt: actualselectedDate,
        childId: "${GetStorage().read('childId')}");

    if (error != "") {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    } else {
      Get.to(PaymentWebviewScreen(
        checkoutId: "${GetStorage().read('checkoutId')}",
        routeName: routeName,
      ));
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
                  Icons.close,
                  size: 50,
                  color: Colors.white,
                )),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Payment Failed'.tr,
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Operation code...'.tr,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.accentColor,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: 50),
          ActionButton(
            onPressed: () async {
              _registerRetryPayment();
            },
            label: 'try again'.tr,
          ),
          SizedBox(height: 20),
          ActionButton(
            onPressed: () async {
              Get.offAll(BottomNavigationWidget());
            },
            label: 'Back to main menu'.tr,
          )
        ],
      ),
    );
  }
}
