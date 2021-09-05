import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/report.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ReportServices {
  static Future<List<Report>?> getAll() async {
    Response response = await Dio().get("$baseUrl/child/report/1",
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
    //response.data.forEach((e) => temp.add(Report.fromJson(e)));
    temp.add(Report.fromJson(response.data));

    return temp;
    //return null;
  }
}
