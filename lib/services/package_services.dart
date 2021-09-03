import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/package.dart';
import 'package:dio/dio.dart';

class PackagesServices {
  static Future<List<Package>?> getAll() async {
    try {
      Response response = await Dio().get("$baseUrl/packages");
      List<Package> temp = [];
      response.data['data'].forEach((e) => temp.add(Package.fromJson(e)));

      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
