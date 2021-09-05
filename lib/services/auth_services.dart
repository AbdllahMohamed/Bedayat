import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class UsersServices {
  static String? getToken() {
    return GetStorage().read('token');
  }

  static Future<String> login(String email, String password) async {
    var loginError = "";

    Dio dio = new Dio();

    Response response = await dio.post(
      "$baseUrl/login",
      data: {
        "email": email,
        "password": password,
      },
      options: Options(
          headers: {
            "Accept": "application/json",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.data['message'] != null) {
      loginError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      final box = GetStorage();
      print("token" + response.data["token"]);
      box.write('token', response.data["token"]);
    }

    return loginError;
  }

  static Future<String> register(
      {String? name,
      String? email,
      String? password,
      String? phone,
      String? countryId}) async {
    var registerError = "";

    Dio dio = new Dio();

    Response response = await dio.post(
      "$baseUrl/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "country_id": countryId,
      },
      options: Options(
          headers: {
            "Accept": "application/json",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.data['message'] != null) {
      registerError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      User.fromJson(response.data['data']);
    }

    return registerError;
  }
}
