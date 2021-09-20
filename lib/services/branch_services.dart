import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/branch.dart';
import 'package:dio/dio.dart';

class BranchesServices {
  static Future<List<Branch>?> getAll() async {
    try {
      Response response = await Dio().get("$baseApiUrl/branches");
      List<Branch> temp = [];
      print('braches');
      print(response.data['data']);
      response.data['data'].forEach((e) => temp.add(Branch.fromJson(e)));
      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
