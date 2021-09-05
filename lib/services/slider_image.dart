import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/slider_image.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class SliderImagesServices {
  static Future<List<SliderImage>?> getAll() async {
    //print("token request " + GetStorage().read('token'));
    Response response = await Dio().get(
      "$baseUrl/slider",
      options: Options(
        headers: {
          "Authorization": "Bearer 11|YLUTxkQjhHQfThf9DvubbdJzdIatfkHbNb1ZjPGb",
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