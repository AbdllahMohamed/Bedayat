import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/food_package_details.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class FoodPackageDetailsServices {
  static Future<void> getFoodPackageDetails(
    int packageId,
    List<FoodPackageDetails> firstWeek,
    List<FoodPackageDetails> secondWeek,
    List<FoodPackageDetails> thirhWeek,
    List<FoodPackageDetails> fourthWeek,
  ) async {
    Response response = await Dio().get(
      "$baseApiUrl/foodpackages/items/$packageId",
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

    print("FoodPackage");
    print(response.data);
    response.data['week_1']
        .forEach((e) => firstWeek.add(FoodPackageDetails.fromJson(e)));
    response.data['week_2']
        .forEach((e) => secondWeek.add(FoodPackageDetails.fromJson(e)));
    response.data['week_3']
        .forEach((e) => thirhWeek.add(FoodPackageDetails.fromJson(e)));
    response.data['week_4']
        .forEach((e) => fourthWeek.add(FoodPackageDetails.fromJson(e)));
  }
}
