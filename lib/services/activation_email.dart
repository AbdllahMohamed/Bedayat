import 'package:bedayat/const/const.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ActivationEmailServices {
  static Future<void> activationEmailServices() async {
    Response response = await Dio().get("$baseApiUrl/email/resend",
        options: Options(
            headers: {
              "Authorization": "Bearer ${GetStorage().read('token')}",
              "Accept": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    print(response.data);

    //return null;
  }
}
