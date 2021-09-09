import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/child.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ChildrenServices {
  static Future<List<Child>?> getAll() async {
    print("${GetStorage().read('token')}");
    Response response = await Dio().get("$baseUrl/children",
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
    List<Child> temp = [];
    print('children');
    print(response.data);
    response.data['data'].forEach((e) => temp.add(Child.fromJson(e)));

    return temp;

    //return null;
  }
}
