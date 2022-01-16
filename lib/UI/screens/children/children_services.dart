import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/child.dart';
import 'package:dio/dio.dart';

import 'package:get_storage/get_storage.dart';
import '../../../utilities.dart';

class ChildrenServices {
  // ignore: non_constant_identifier_names
  static getChildrenForTeacher({int pageNumber = 1}) async {
    String token = GetStorage().read('token');

    var response = await Dio().get(
      '$baseApiUrl/teacher/children?page=$pageNumber',
      options: Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == 200) {
      List<Child> childrenTemp = [];
      response.data["data"].forEach(
          (notification) => childrenTemp.add(Child.fromJson(notification)));
      return childrenTemp;
    } else {
      showErrorSnackbar(
          title: "children error", message: "not able to get children");
    }
  }
}
