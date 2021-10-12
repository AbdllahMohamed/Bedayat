import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/add_child.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class EditChildServices {
  static Future<List<AddChild>?> getEditChildData(String childId) async {
    Response response = await Dio().get("$baseApiUrl/child/$childId",
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
    List<AddChild> temp = [];
    print('edit child');
    print(response.data);
    temp.add(AddChild.fromJson(response.data['data']));

    return temp;
  }
}
