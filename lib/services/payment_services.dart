import 'package:bedayat/const/const.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class PaymentServices {
  static Future<String> getCheckoutId({
    String? packageId,
    String? email,
    String? street,
    String? city,
    String? state,
    String? postcode,
    String? givenName,
    String? surname,
    String? paymentMethod,
    String? childId,
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
      paymentError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      final box = GetStorage();
      await box.write('checkoutId', response.data['id']);
    }
    return paymentError;
  }
}
