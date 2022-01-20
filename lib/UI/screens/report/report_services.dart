import 'dart:io';
import 'dart:math';

import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/report.dart';

import 'package:dio/dio.dart' as Dio;

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../../utilities.dart';
import '../../../models/activity.dart';

class ReportsServices {
  // ignore: non_constant_identifier_names
  static getActivites() async {
    String token = GetStorage().read('token');

    var response = await Dio.Dio().get(
      '$baseApiUrl/activites',
      options: Dio.Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == 200) {
      List<Activity> activitesTemp = [];
      response.data["data"].forEach(
          (activity) => activitesTemp.add(Activity.fromJson(activity)));
      return activitesTemp;
    } else {
      showErrorSnackbar(
          title: "activites error", message: "not able to get activites");
    }
  }

  static getLastChildReport(int childId) async {
    String token = GetStorage().read('token');

    var response = await Dio.Dio().get(
      '$baseApiUrl/child/report/$childId',
      options: Dio.Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.statusCode == 200) {
      if (response.data["data"] != null)
        return Report.fromJson(response.data["data"]);
      else
        return null;
    } else {
      showErrorSnackbar(
          title: "reports error", message: "not able to get reports");
    }
  }

  static saveReport(
      {required String childMoodMorning,
      required String childMoodNoon,
      required String childMoodAfterNoon,
      required String foodStatusMorning,
      required String foodStatusNoon,
      required String foodStatusAfterNoon,
      required String drinkStatus,
      required String sleepStatus,
      required double temp,
      required double sleep,
      required String notes,
      required int poe,
      required int pie,
      required List<dynamic> selectedActivites,
      required List<dynamic> attachments,
      required uploadHandler,
      required childId,
      required DateTime started_at}) async {
    String token = GetStorage().read('token');

    var response = await Dio.Dio().post(
      '$baseApiUrl/reports',
      data: {
        "mood_status_morning": childMoodMorning,
        "mood_status_noon": childMoodNoon,
        "mood_status_afternoon": childMoodAfterNoon,
        "food_status_breakfast": foodStatusMorning,
        "food_status_lunch": foodStatusNoon,
        "food_status_snak": foodStatusAfterNoon,
        "drink_status": drinkStatus,
        "sleep_status": sleepStatus,
        "sleep_dration": sleep,
        "temperature_degree": temp,
        "poe_numbers": poe,
        "pie_numbers": pie,
        "child_id": childId,
        "user_id": GetStorage().read("userId"),
        "activites": selectedActivites,
        "teacher_started_at": started_at.toString(),
        "notes": notes
      },
      options: Dio.Options(
          headers: {"Authorization": "Bearer $token"},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    attachments.forEach((element) {
      uploadAttachment(
          file: element, reportId: response.data['data']['id'].toString());
    });

    if (response.statusCode == 201) {
      showSuccessSnackbar(
          title: "reports".tr, message: "added_successfully".tr);
    } else {
      showErrorSnackbar(
          title: "reports error", message: "not able to create report");
    }
  }

  static uploadAttachment({
    required File file,
    required String reportId,
  }) async {
    String token = GetStorage().read('token');
    String fileName = file.path.split('/').last;
    var formData = Dio.FormData.fromMap({
      'report_id': reportId,
      'user_id': GetStorage().read("userId"),
      'file': await Dio.MultipartFile.fromFile(file.path, filename: fileName),
    });
    var response = await Dio.Dio().post(
      '$baseApiUrl/reports/attachments',
      data: formData,
      onSendProgress: (int sent, int total) {
        showSuccessSnackbar(
            title: "Upload Status".tr,
            message:
                "${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)");
      },
      options: Dio.Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json"
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    print(response);

    if (response.statusCode == 201) {
      showSuccessSnackbar(
          title: "reports".tr, message: "added_successfully".tr);
    } else {
      showErrorSnackbar(
          title: "reports error", message: "not able to create report");
    }
  }
}
