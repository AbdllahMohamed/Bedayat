import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/branch.dart';
import 'package:dio/dio.dart';

class BranchesServices {
  static Future<List<Branch>?> getAll() async {
    try {
      Response response = await Dio().get("$baseUrl/branches");
      List<Branch> temp = [];
      response.data['data'].forEach((e) => temp.add(Branch.fromJson(e)));
      print(temp[0].title);
      print(temp[1].title);
      print(temp[2].title);
      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
