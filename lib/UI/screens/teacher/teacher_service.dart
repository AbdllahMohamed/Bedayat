import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/offer.dart';
import 'package:bedayat/models/rating.dart';
import 'package:bedayat/models/teacher.dart';
import 'package:dio/dio.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../../utilities.dart';

class TeacherServices {
  // ignore: non_constant_identifier_names
  static getRatings({required int teacher_id, int pageNumber = 1}) async {
    String token = GetStorage().read('token');
    var response = await Dio().get(
      '$baseApiUrl/ratings/$teacher_id?page=$pageNumber',
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == 200) {
      List<Rating> ratingsTemp = [];
      response.data["data"]
          .forEach((rating) => ratingsTemp.add(Rating.fromJson(rating)));
      return ratingsTemp;
    } else {
      showErrorSnackbar(
          title: "rating error".tr, message: "not able to get ratings".tr);
    }
  }

  static userAbleToRate() async {
    String token = GetStorage().read('token');

    var response = await Dio().get(
      '$baseApiUrl/rating/verify',
      options: Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );

    if (response.statusCode == 200) {
      return response.data == 1 ? true : false;
    } else {
      showErrorSnackbar(
          title: "rating verify error".tr, message: "rating verify error".tr);
    }
  }

  static rate(
      {required int rate, required String comment, successHandler}) async {
    String token = GetStorage().read('token');

    if (!(GetStorage().hasData('token'))) return false;

    var response = await Dio().post(
      '$baseApiUrl/rating',
      options: Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );

    if (response.statusCode == 200) {
      // return rate model
      successHandler();
    } else {
      showErrorSnackbar(
          title: "post rating error".tr, message: "post rating error".tr);
    }
  }

  static getTeacherData({required int teacher_id}) async {
    String token = GetStorage().read('token');

    var response = await Dio().get(
      '$baseApiUrl/teachers/$teacher_id',
      options: Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );

    if (response.statusCode == 200) {
      return Teacher.fromJson(response.data["data"]);
    } else {
      showErrorSnackbar(
          title: "get teacher data error".tr, message: "try in anthor time".tr);
    }
  }
}
