import 'dart:typed_data';

import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

class UsersServices {
  static String? getToken() {
    return GetStorage().read('token');
  }

  static Future<String> login(String email, String password) async {
    var loginError = "";

    Dio dio = new Dio();

    Response response = await dio.post(
      "$baseApiUrl/login",
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
    print(response.data['message']);
    if (response.data['message'] != null) {
      loginError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      final box = GetStorage();
      print("token" + response.data["token"]);
      box.write('token', response.data["token"]);
      box.write('userEmail', email);
      print("${GetStorage().read('userEmail')}");
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
    String? checkoutId,
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
      "checkout_id": checkoutId,
      "family_card": await MultipartFile.fromFile(familyCard.path,
          filename: familyCardFile),
      "vaccination_certificate": await MultipartFile.fromFile(
          vaccinationCertificate.path,
          filename: vaccinationCertificateFile),
      "document":
          await MultipartFile.fromFile(document.path, filename: documentFile),
    });
    Response response = await dio.post(
      "$baseApiUrl/register",
      data: formData,
      options: Options(
          headers: {
            "Accept": "application/json",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 600;
          }),
    );

    print("register");
    print(response.data);
    if (response.data['message'] != null) {
      registerError = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    } else {
      User.fromJson(response.data['data']);
    }

    return registerError;
  }

  static Future<String> registerWeb({
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
    String? checkoutId,
    String? groupId,
    XFile? familyCard,
    XFile? vaccinationCertificate,
    XFile? document,
  }) async {
    var registerError = "";

    PickedFile uploadfamilyCard = PickedFile(familyCard.toString());
    PickedFile uploadvaccinationCertificate =
        PickedFile(vaccinationCertificate.toString());
    PickedFile uploaddocument = PickedFile(document.toString());
    var stream =
        // ignore: deprecated_member_use
        new http.ByteStream(
            // ignore: deprecated_member_use
            DelegatingStream.typed(uploadfamilyCard.openRead()));

    var uri = Uri.parse("$baseApiUrl/register");
    var length1 = await familyCard!.length();
    var length2 = await vaccinationCertificate!.length();
    var length3 = await document!.length();
    var request = new http.MultipartRequest(
      "POST",
      uri,
    );
    var multipartFile1 = new http.MultipartFile('files', stream, length1,
        filename: basename(uploadfamilyCard.path),
        contentType: MediaType('image', 'png'));
    var multipartFile2 = new http.MultipartFile('files', stream, length2,
        filename: basename(uploadvaccinationCertificate.path),
        contentType: MediaType('image', 'png'));
    var multipartFile3 = new http.MultipartFile('files', stream, length3,
        filename: basename(uploaddocument.path),
        contentType: MediaType('image', 'png'));

    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);
    request.fields["username"] = username!;
    request.fields["email"] = email!;
    request.fields["phone"] = phone!;
    request.fields["password"] = password!;
    request.fields["name"] = childname!;
    request.fields["age_group"] = ageGroup!;
    request.fields["gender"] = gender!;
    request.fields["emergency_number"] = emergencyNumber!;
    request.fields["parent_one_realation"] = parentOneRealation!;
    request.fields["parent_one_email"] = parentOneEmail!;
    request.fields["parent_one_phone"] = parentOnePhone!;
    request.fields["parent_two_realation"] = parentTwoRealation!;
    request.fields["parent_two_email"] = parentTwoEmail!;
    request.fields["parent_two_phone"] = parentTwoPhone!;
    request.fields["user_id"] = userId!;
    request.fields["teacher_id"] = teacherId!;
    request.fields["group_id"] = groupId!;
    request.fields["checkout_id"] = checkoutId!;

    var response = await request.send();
    print('response.statusCode');
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    print(registerError);

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
    String? checkoutId,
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
      "checkout_id": checkoutId,
      "family_card": await MultipartFile.fromFile(familyCard.path,
          filename: familyCardFile),
      "vaccination_certificate": await MultipartFile.fromFile(
          vaccinationCertificate.path,
          filename: vaccinationCertificateFile),
      "document":
          await MultipartFile.fromFile(document.path, filename: documentFile),
    });
    Response response = await dio.post(
      "$baseApiUrl/addchild",
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
