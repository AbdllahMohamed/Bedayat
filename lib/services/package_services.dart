import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/package.dart';
import 'package:dio/dio.dart';

class PackagesServices {
  static Future<List<Package>?> getAll() async {
    try {
      Response response = await Dio().get("$baseUrl/packages");
      List<Package> temp = [];
      print(response.data);
      response.data['data'].forEach((e) => temp.add(Package.fromJson(e)));
      print(response.data);

      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
