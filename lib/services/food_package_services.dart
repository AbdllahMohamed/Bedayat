import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/food_package.dart';
import 'package:bedayat/models/slider_image.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class FoodPackageServices {
  static Future<List<FoodPackage>?> getFoodPackage() async {
    Response response = await Dio().get(
      "$baseApiUrl/foodpackages",
      options: Options(
        headers: {
          "Authorization": "Bearer ${GetStorage().read('token')}",
          "Accept": "application/json",
        },
        contentType: "application/x-www-form-urlencoded",
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
    List<FoodPackage> temp = [];
    print("FoodPackage");
    print(response.data);
    response.data['data'].forEach((e) => temp.add(FoodPackage.fromMap(e)));

    return temp;
  }
}
