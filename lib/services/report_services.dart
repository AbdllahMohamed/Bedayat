import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/report.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ReportServices {
  static Future<List<Report>?> getAll(int childId) async {
    print(childId);
    Response response = await Dio().get("$baseApiUrl/child/report/$childId",
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
    print('report');
    print(response.data);
    temp.add(Report.fromJson(response.data));

    return temp;
  }
}
