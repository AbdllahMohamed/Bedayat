import 'package:bedayat/UI/screens/offers/offer_services.dart';
import 'package:bedayat/models/offer.dart';
import 'package:bedayat/services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var loadingProcess = false.obs;
  RxDouble taxRatio = 1.0.obs;
  var offer = Rxn<Offer>();

  TextEditingController promoCode = new TextEditingController();
  var loadingProcessForVerifyPromoCode = false.obs;

  Future<String> getCheckoutId({
    String? packageId,
    String? foodPackageId,
    String? email,
    String? street,
    String? city,
    String? state,
    String? postcode,
    String? givenName,
    String? surname,
    String? paymentMethod,
    String? childId,
    String? startAt,
  }) async {
    var paymentError = "";
    try {
      loadingProcess(true);
      paymentError = await PaymentServices.getCheckoutId(
          packageId: packageId,
          email: email,
          street: street,
          city: city,
          state: state,
          postcode: postcode,
          givenName: givenName,
          surname: surname,
          paymentMethod: paymentMethod,
          childId: childId,
          startAt: startAt,
          foodPackageId: foodPackageId,
          promoCode: promoCode.text);
    } catch (e) {
      print(e);
      paymentError = 'Please try again'.tr;
    } finally {
      loadingProcess(false);
    }
    return paymentError;
  }

  getTaxes() async {
    loadingProcess(true);
    print("tax number here");
    taxRatio.value = await PaymentServices.getTaxRatio();
    loadingProcess(false);
  }

  verifyPromoCode({required int childId}) async {
    loadingProcessForVerifyPromoCode(true);
    offer.value = await OffersServices.verifyOffer(
        promoCode: promoCode.text, childId: childId);
    loadingProcessForVerifyPromoCode(false);
  }

  deletePromoCode() async {
    promoCode.clear();
    offer.value = null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaxes();
  }
}
