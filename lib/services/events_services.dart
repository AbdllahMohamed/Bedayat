import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/event.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class EventsServices {
  static Future<List<Event>?> getAll([String? selectedData]) async {
    Response response = await Dio().get("$baseApiUrl/events?date=$selectedData",
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
    List<Event> temp = [];
    print(response.data);
    response.data['data'].forEach((e) => temp.add(Event.fromJson(e)));

    print(response.data);
    print(temp[0]);
    return temp;

    //return null;
  }
}
