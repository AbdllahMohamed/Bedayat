import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/notification.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class NotificationsServices {
  static Future<List<Notifications>?> getAll() async {
    try {
      Response response = await Dio().get(
        "$baseUrl/notifications",
        options: Options(
          headers: {
            "Authorization": "Bearer ${GetStorage().read('token')}",
            "Accept": "application/json",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      List<Notifications> temp = [];
      print(response.data['data']);
      response.data['data'].forEach((e) => temp.add(Notifications.fromJson(e)));

      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
