import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/group.dart';
import 'package:dio/dio.dart';

class GroupsServices {
  static Future<List<Group>?> getAll(int? branchId) async {
    try {
      Response response = await Dio().get("$baseUrl/branches/$branchId/groups");
      List<Group> temp = [];
      response.data['data'].forEach((e) => temp.add(Group.fromJson(e)));

      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}