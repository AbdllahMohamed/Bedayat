import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/add_child.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ResetPasswordServices {
  static Future<String> reset(String email) async {
    Response response = await Dio().post("$baseApiUrl/reset",
        data: {'email': email},
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
    String responce = '';
    if (response.data['message'] != null) {
      responce = 'your email is not found';
    } else {
      responce = 'we have sent a reset message to your email';
    }

    return responce;
  }
}
