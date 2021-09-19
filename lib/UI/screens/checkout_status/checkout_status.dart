import 'package:bedayat/UI/screens/payment_web_view/payment_web_view.dart';
import 'package:bedayat/UI/screens/register/register_step_five.dart';
import 'package:bedayat/UI/screens/register/register_step_six.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class CheckoutStatusScreen extends StatefulWidget {
  String checkoutId;

  CheckoutStatusScreen({
    required this.checkoutId,
  });
  @override
  _CheckoutStatusScreenState createState() => _CheckoutStatusScreenState();
}

class _CheckoutStatusScreenState extends State<CheckoutStatusScreen> {
  CheckoutStatusController checkoutStatusController =
      Get.put(CheckoutStatusController());
  @override
  void initState() {
    super.initState();
    print('in status');
    checkoutStatusController.fetchCheckoutStatusCode(widget.checkoutId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => checkoutStatusController.loadingProcess.value
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.accentColor,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (_, i) {
                  return checkoutStatusController
                              .checkoutstatusCodeList[i].code ==
                          "000.100.110"
                      ? SucessCheckout()
                      : FailuarCheckot();
                },
              ),
      ),
    );
  }
}

class SucessCheckout extends StatefulWidget {
  const SucessCheckout({Key? key}) : super(key: key);

  @override
  _SucessCheckoutState createState() => _SucessCheckoutState();
}

class _SucessCheckoutState extends State<SucessCheckout> {
  @override
  void initState() {
    super.initState();
    _navegatoTo();
  }

  void _navegatoTo() {
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
                'تم الدفع بنجاح',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'جارى إتمام الدفع...',
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

class FailuarCheckot extends StatelessWidget {
  FailuarCheckot({Key? key}) : super(key: key);
  PaymentController paymentController = Get.put(PaymentController());

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
                    Icons.close,
                    size: 50,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'فشل فى عملية الدفع',
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
                'كود العملية...',
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
                String error = await paymentController
                    .getCheckoutId((selectedPackageIndex! + 1).toString());

                if (error != "") {
                  Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
                } else {
                  Get.to(WebViewXPage(
                      checkoutId: "${GetStorage().read('checkoutId')}"));
                }
              },
              label: 'المحاولة من جديد',
            )
          ],
        ),
      ),
    );
  }
}
