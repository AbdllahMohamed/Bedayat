import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/teacher.dart';
import 'package:dio/dio.dart';

class TeachersServices {
  static Future<List<Teacher>?> getAll(int? groupId) async {
    try {
      Response response =
          await Dio().get("$baseApiUrl/groups/$groupId/teachers");
      List<Teacher> temp = [];
      print('teacher');
      print(response.data['data']);
      response.data['data'].forEach((e) => temp.add(Teacher.fromJson(e)));

      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
