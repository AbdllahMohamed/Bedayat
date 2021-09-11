import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class UsersServices {
  static String? getToken() {
    return GetStorage().read('token');
  }

  static Future<String> login(String email, String password) async {
    var loginError = "";

    Dio dio = new Dio();

    Response response = await dio.post(
      "$baseUrl/login",
      data: {
        "email": email,
        "password": password,
      },
      options: Options(
          headers: {
            "Accept": "application/json",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    if (response.data['message'] != null) {
      loginError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      final box = GetStorage();
      print("token" + response.data["token"]);
      box.write('token', response.data["token"]);
    }

    return loginError;
  }

  static Future<String> register({
    String? username,
    String? email,
    String? phone,
    String? password,
    String? childname,
    String? ageGroup,
    String? gender,
    String? emergencyNumber,
    String? parentOneRealation,
    String? parentOneEmail,
    String? parentOnePhone,
    String? parentTwoRealation,
    String? parentTwoEmail,
    String? parentTwoPhone,
    String? userId,
    String? teacherId,
    String? groupId,
    XFile? familyCard,
    XFile? vaccinationCertificate,
    XFile? document,
  }) async {
    var registerError = "";

    Dio dio = new Dio();

    String familyCardFile = familyCard!.path.split('/').last;
    String vaccinationCertificateFile =
        vaccinationCertificate!.path.split('/').last;
    String documentFile = document!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
      "name": childname,
      "age_group": ageGroup,
      "gender": gender,
      "emergency_number": emergencyNumber,
      "parent_one_realation": parentOneRealation,
      "parent_one_email": parentOneEmail,
      "parent_one_phone": parentOnePhone,
      "parent_two_realation": parentTwoRealation,
      "parent_two_email": parentTwoEmail,
      "parent_two_phone": parentTwoPhone,
      "user_id": userId,
      "teacher_id": teacherId,
      "group_id": groupId,
      "family_card": await MultipartFile.fromFile(familyCard.path,
          filename: familyCardFile),
      "vaccination_certificate": await MultipartFile.fromFile(
          vaccinationCertificate.path,
          filename: vaccinationCertificateFile),
      "document":
          await MultipartFile.fromFile(document.path, filename: documentFile),
    });
    Response response = await dio.post(
      "$baseUrl/register",
      data: formData,
      options: Options(
          headers: {
            "Accept": "application/json",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    print("response.data");
    print(response.data);
    if (response.data['message'] != null) {
      registerError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      User.fromJson(response.data['data']);
    }

    return registerError;
  }

  static Future<String> addchild({
    String? childname,
    String? ageGroup,
    String? gender,
    String? emergencyNumber,
    String? parentOneRealation,
    String? parentOneEmail,
    String? parentOnePhone,
    String? parentTwoRealation,
    String? parentTwoEmail,
    String? parentTwoPhone,
    String? userId,
    String? teacherId,
    String? groupId,
    XFile? familyCard,
    XFile? vaccinationCertificate,
    XFile? document,
  }) async {
    var registerError = "";

    Dio dio = new Dio();

    String familyCardFile = familyCard!.path.split('/').last;
    String vaccinationCertificateFile =
        vaccinationCertificate!.path.split('/').last;
    String documentFile = document!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": childname,
      "age_group": ageGroup,
      "gender": gender,
      "emergency_number": emergencyNumber,
      "parent_one_realation": parentOneRealation,
      "parent_one_email": parentOneEmail,
      "parent_one_phone": parentOnePhone,
      "parent_two_realation": parentTwoRealation,
      "parent_two_email": parentTwoEmail,
      "parent_two_phone": parentTwoPhone,
      "user_id": userId,
      "teacher_id": teacherId,
      "group_id": groupId,
      "family_card": await MultipartFile.fromFile(familyCard.path,
          filename: familyCardFile),
      "vaccination_certificate": await MultipartFile.fromFile(
          vaccinationCertificate.path,
          filename: vaccinationCertificateFile),
      "document":
          await MultipartFile.fromFile(document.path, filename: documentFile),
    });
    Response response = await dio.post(
      "$baseUrl/addchild",
      data: formData,
      options: Options(
          headers: {
            "Authorization": "Bearer ${GetStorage().read('token')}",
            "Accept": "application/json",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    print("response.data");
    print(response.data);
    if (response.data['message'] != null) {
      registerError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      User.fromJson(response.data['data']);
    }

    return registerError;
  }
}
