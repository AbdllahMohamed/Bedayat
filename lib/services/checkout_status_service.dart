import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/checkout_status.dart';
import 'package:dio/dio.dart';

class CheckoutStatusServices {
  static Future<List<CheckoutStatus>?> getCheckoutStatusCode(
      String checkoutId) async {
    print('checkoutId           ' + checkoutId);
    Response response = await Dio().post("$baseApiUrl/payments/status",
        data: {
          'checkout_id': checkoutId,
        },
        options: Options(
            headers: {
              "Accept": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print("checkout stats code");
    print(response.data['result']);
    List<CheckoutStatus> temp = [];
    temp.add(CheckoutStatus.fromJson(response.data['result']));
    return temp;
  }
}
