import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/package.dart';
import 'package:dio/dio.dart';

class PackagesServices {
  static Future<List<Package>?> getAll() async {
    try {
      Response response = await Dio().get("$baseApiUrl/packages",
          options: Options(
              headers: {
                "Accept": "application/json",
              },
              contentType: "application/x-www-form-urlencoded",
              followRedirects: false,
              validateStatus: (status) {
                return true;
              }));
      List<Package> temp = [];
      response.data['data'].forEach((e) => temp.add(Package.fromJson(e)));
      print(response.data);
      return temp;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
