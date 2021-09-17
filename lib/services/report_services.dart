import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/report.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ReportServices {
  static Future<List<Report>?> getAll() async {
    Response response = await Dio().get("$baseApiUrl/child/report/7",
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
    List<Report> temp = [];
    temp.add(Report.fromJson(response.data));

    return temp;
  }
}
