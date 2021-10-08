import 'package:bedayat/UI/screens/checkout_status/add_child_checkout_stats/failuar_add_child_checkout.dart';
import 'package:bedayat/UI/screens/checkout_status/add_child_checkout_stats/success_add_child_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';

// ignore: must_be_immutable
class AddChildCheckotStatusScreen extends StatefulWidget {
  final String checkoutId;

  AddChildCheckotStatusScreen({
    Key? key,
    required this.checkoutId,
  }) : super(key: key);

  @override
  _AddChildCheckotStatusScreenState createState() =>
      _AddChildCheckotStatusScreenState();
}

class _AddChildCheckotStatusScreenState
    extends State<AddChildCheckotStatusScreen> {
  CheckoutStatusController checkoutStatusController =
      Get.put(CheckoutStatusController());
  @override
  void initState() {
    super.initState();

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
                  return (checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.100.110" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              '000.000.000' ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.100.110" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.000" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.100" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.101" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.102" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.103")
                      ? SuccessAddChildCheckout()
                      : FailuarAddChildCheckout();
                },
              ),
      ),
    );
  }
}
