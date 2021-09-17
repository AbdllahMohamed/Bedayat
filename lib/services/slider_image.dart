import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/slider_image.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class SliderImagesServices {
  static Future<List<SliderImage>?> getAll() async {
    Response response = await Dio().get(
      "$baseApiUrl/slider",
      options: Options(
        headers: {
          "Authorization": "Bearer ${GetStorage().read('token')}",
          "Accept": "application/json",
        },
        contentType: "application/x-www-form-urlencoded",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    List<SliderImage> temp = [];
    print(response.data);
    response.data['data'].forEach((e) => temp.add(SliderImage.fromJson(e)));

    return temp;
  }
}
