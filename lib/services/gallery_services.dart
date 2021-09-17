import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/gallery.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class GalleryServices {
  static Future<List<Gallery>?> getAll(int childId) async {
    Response response = await Dio().get("$baseApiUrl/child/gallery/$childId",
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
    List<Gallery> temp = [];
    print(response.data);
    response.data['data'].forEach((e) => temp.add(Gallery.fromJson(e)));
    print(response.data);
    return temp;

    //return null;
  }
}
