import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/User.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class UserServices {
  static Future<List<User>?> getAll() async {
    Response response = await Dio().get("$baseApiUrl/user/info",
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
    List<User> temp = [];
    print('User');
    print(response.data);
    temp.add(User.fromJson(response.data));
    print(temp[0].emailVerifiedAt);

    return temp;
  }
}
