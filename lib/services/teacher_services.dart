import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/teacher.dart';
import 'package:dio/dio.dart';

class TeachersServices {
  static Future<List<Teacher>?> getAll(int? groupId) async {
    try {
      Response response = await Dio().get("$baseUrl/groups/17/teachers");
      List<Teacher> temp = [];
      response.data['data'].forEach((e) => temp.add(Teacher.fromJson(e)));

      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
