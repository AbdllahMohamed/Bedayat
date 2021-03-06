import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/offer.dart';
import 'package:dio/dio.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../../utilities.dart';

class OffersServices {
  // ignore: non_constant_identifier_names
  static getOffers({int pageNumber = 1}) async {
    String token = GetStorage().read('token');

    var response = await Dio().get(
      '$baseApiUrl/offers?page=$pageNumber',
      options: Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == 200) {
      List<Offer> notificationsTemp = [];
      response.data["data"].forEach((notification) =>
          notificationsTemp.add(Offer.fromJson(notification)));
      return notificationsTemp;
    } else {
      showErrorSnackbar(
          title: "offers error", message: "not able to get offers");
    }
  }

  static verifyOffer({required String promoCode, required int childId}) async {
    String token = GetStorage().read('token');

    var response = await Dio().get(
      '$baseApiUrl/offers/check/$promoCode/$childId',
      options: Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );

    if (response.statusCode == 200) {
      Offer offerTemp = Offer.fromJson(response.data);
      return offerTemp;
    } else {
      showErrorSnackbar(
          title: "Promo code error".tr,
          message: response.data["message"].toString().tr);
    }
  }
}
