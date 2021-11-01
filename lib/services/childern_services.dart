import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/child.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ChildrenServices {
  static Future<List<Child>?> getAll() async {
    Response response = await Dio().get("$baseApiUrl/children",
        options: Options(
            headers: {
              "Authorization": "Bearer ${GetStorage().read('token')}",
              "Accept": "application/json",
            },
            contentType: "application/x-www-form-urlencoded",
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
    List<Child> temp = [];
    print('children responce');
    print(response.data['data']);
    response.data['data'].forEach((e) => temp.add(Child.fromJson(e)));

    return temp;

    //return null;
  }
}
