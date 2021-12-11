import 'package:bedayat/const/const.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

import '../utilities.dart';

class PaymentServices {
  // ignore: non_constant_identifier_names
  static getTaxRatio() async {
    String token = GetStorage().read('token');

    var response = await Dio().get(
      '$baseApiUrl/taxes',
      options: Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == 200) {
      return double.parse(response.data["ratio"]);
    } else {
      showErrorSnackbar(
          title: "taxes error",
          message:
              "not able to get tax ratio , maybe you will face incorrect numbers in payment page please reopren the page");
    }
  }

  static Future<String> getCheckoutId({
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
    String? promoCode,
  }) async {
    var paymentError = "";

    Dio dio = new Dio();

    Response response = await dio.post(
      "$baseApiUrl/payments/getcheckoutId",
      data: {
        "package_id": packageId,
        "email": email,
        "street": street,
        "city": city,
        "state": state,
        "postcode": postcode,
        "givenName": givenName,
        "surname": surname,
        "payment_method": paymentMethod,
        "child_id": childId,
        "start_at": startAt,
        "food_package_id": foodPackageId,
        "promo_code": promoCode,
      },
      options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${GetStorage().read('token')}",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) => true),
    );
    print('payment responce');
    print(response.data);
    if (response.data['id'] == null) {
      paymentError = 'Please try again'.tr;
    } else {
      final box = GetStorage();
      await box.write('checkoutId', response.data['checkout_id']);
      print("${GetStorage().read('checkoutId')}");
    }
    return paymentError;
  }
}
