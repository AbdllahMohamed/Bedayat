import 'dart:io';

import 'package:bedayat/const/const.dart';

import 'package:dio/dio.dart' as Dio;

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../../../utilities.dart';
import '../../../../models/activity.dart';

class GalleryServices {
  static uploadImageOrVideo({
    required File file,
    required String childId,
  }) async {
    String token = GetStorage().read('token');

    String fileName = file.path.split('/').last;
    var formData = Dio.FormData.fromMap({
      'child_id': childId,
      'user_id': GetStorage().read("userId"),
      'img': await Dio.MultipartFile.fromFile(file.path, filename: fileName),
    });

    var response = await Dio.Dio().post(
      '$baseApiUrl/gallery',
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
          title: "galleries".tr, message: "added_successfully".tr);
    } else {
      showErrorSnackbar(
          title: "galleries error",
          message: "not able to create  Image or video");
    }
  }
}
