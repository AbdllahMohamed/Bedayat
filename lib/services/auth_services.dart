import 'dart:core';
import 'package:bedayat/const/const.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
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
    if (response.data['message'] != null) {
      print(response.data['message']);
      loginError = 'Please try again'.tr;
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
    String? groupId,
    XFile? familyCard,
    XFile? vaccinationCertificate,
    XFile? document,
    String? actualselectedDate,
    String? relationOnefirstNameController,
    String? relationOneSecondNameController,
    String? relationOneThirdController,
    String? relationTwoFirstController,
    String? relationTwoScecondController,
    String? relationTwoThirdController,
    String? emergencyNameController,
    String? emergencyRelationController,
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
      'birth_date': actualselectedDate,
      'relation_one_first_name': relationOnefirstNameController,
      'relation_one_second_name': relationOneSecondNameController,
      'relation_one_third_name': relationOneThirdController,
      'relation_two_first_name': relationTwoFirstController,
      'relation_two_scecond_name': relationTwoScecondController,
      'relation_two_third_name': relationTwoThirdController,
      'emergency_name': emergencyNameController,
      'emergency_relation': emergencyRelationController,
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
      registerError = 'Please try again'.tr;
    } else {
      print("From Register");
      final box = GetStorage();
      print(response.data["data"]['id']);
      box.write('childId', response.data["data"]['id']);
      print("${GetStorage().read('childId')}");
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
    String? relationOnefirstNameController,
    String? relationOneSecondNameController,
    String? relationOneThirdController,
    String? relationTwoFirstController,
    String? relationTwoScecondController,
    String? relationTwoThirdController,
    String? emergencyNameController,
    String? emergencyRelationController,
    String? streetController,
    String? cityController,
    String? stateController,
    String? postCodeController,
    String? givenNameController,
    String? surnameController,
    String? birthDate,
  }) async {
    var registerError = "";
    print(username);
    print(email);
    print(phone);

    print(password);

    print(childname);

    print(ageGroup);

    print(gender);

    print(emergencyNumber);

    print(parentOneRealation);

    print(parentOneEmail);

    print(parentOnePhone);

    print(parentTwoRealation);

    print(parentTwoEmail);

    print(parentTwoPhone);

    print(userId);

    print(teacherId);

    print(groupId);

    print(familyCard.toString());

    print(vaccinationCertificate.toString());

    print(document.toString());

    PickedFile uploadfamilyCard = PickedFile(familyCard!.path);
    PickedFile uploadvaccinationCertificate =
        PickedFile(vaccinationCertificate!.path);
    PickedFile uploaddocument = PickedFile(document!.path);
    var stream1 =
        // ignore: deprecated_member_use
        new http.ByteStream(
            // ignore: deprecated_member_use
            DelegatingStream.typed(uploadvaccinationCertificate.openRead()));
    var stream2 =
        // ignore: deprecated_member_use
        new http.ByteStream(
            // ignore: deprecated_member_use
            DelegatingStream.typed(uploadfamilyCard.openRead()));
    var stream3 =
        // ignore: deprecated_member_use
        new http.ByteStream(
            // ignore: deprecated_member_use
            DelegatingStream.typed(uploaddocument.openRead()));

    var uri = Uri.parse("$baseApiUrl/register");
    var length1 = await familyCard.length();
    var length2 = await vaccinationCertificate.length();
    var length3 = await document.length();
    var request = new http.MultipartRequest(
      "POST",
      uri,
    );
    var multipartFile1 = new http.MultipartFile('family_card', stream1, length1,
        filename: basename(uploadfamilyCard.path),
        contentType: MediaType('image', 'png'));
    var multipartFile2 = new http.MultipartFile(
        'vaccination_certificate', stream2, length2,
        filename: basename(uploadvaccinationCertificate.path),
        contentType: MediaType('image', 'png'));
    var multipartFile3 = new http.MultipartFile('document', stream3, length3,
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
    request.fields["age_group"] = '1';
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
    request.fields["relation_one_first_name"] = relationOnefirstNameController!;
    request.fields["relation_one_second_name"] =
        relationOneSecondNameController!;
    request.fields["relation_one_third_name"] = relationOneThirdController!;
    request.fields["relation_two_first_name"] = relationTwoFirstController!;
    request.fields["relation_two_scecond_name"] = relationTwoScecondController!;
    request.fields["relation_two_third_name"] = relationTwoThirdController!;
    request.fields["emergency_name"] = emergencyNameController!;
    request.fields["emergency_relation"] = emergencyRelationController!;
    request.fields["birth_date"] = birthDate!;

    request.headers.addAll({
      "Accept": "application/json",
    });

    var response = await request.send();
    print('response.statusCode');
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("From Register");

      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        Map<String, dynamic> responce = json.decode(value);
        final box = GetStorage();
        print(responce["data"]['id']);
        box.write('childId', responce["data"]['id']);
        print("${GetStorage().read('childId')}");
      });
    } else {
      registerError = 'Please try again'.tr;
    }
    print(registerError);

    return registerError;
  }

  static Future<String> addchild({
    String? childname,
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
    String? actualselectedDate,
    String? relationOnefirstNameController,
    String? relationOneSecondNameController,
    String? relationOneThirdController,
    String? relationTwoFirstController,
    String? relationTwoScecondController,
    String? relationTwoThirdController,
    String? emergencyNameController,
    String? emergencyRelationController,
  }) async {
    var addChilderror = "";

    Dio dio = new Dio();

    String familyCardFile = familyCard!.path.split('/').last;
    String vaccinationCertificateFile =
        vaccinationCertificate!.path.split('/').last;
    String documentFile = document!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": childname,
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
      'birth_date': actualselectedDate,
      'relation_one_first_name': relationOnefirstNameController,
      'relation_one_second_name': relationOneSecondNameController,
      'relation_one_third_name': relationOneThirdController,
      'relation_two_first_name': relationTwoFirstController,
      'relation_two_scecond_name': relationTwoScecondController,
      'relation_two_third_name': relationTwoThirdController,
      'emergency_name': emergencyNameController,
      'emergency_relation': emergencyRelationController,
      'age_group': '1',
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

    print("addchildMobile");
    print(response.data);
    if (response.data['message'] != null) {
      addChilderror = 'Please try again'.tr;
    } else {
      final box = GetStorage();
      box.write('addChildId', response.data["data"]['id'].toString());
    }

    return addChilderror;
  }

  static Future<String> addchildWeb({
    String? childname,
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
    String? actualselectedDate,
    String? relationOnefirstNameController,
    String? relationOneSecondNameController,
    String? relationOneThirdController,
    String? relationTwoFirstController,
    String? relationTwoScecondController,
    String? relationTwoThirdController,
    String? emergencyNameController,
    String? emergencyRelationController,
  }) async {
    var addChilderror = "";

    print(childname);
    print(gender);
    print(emergencyNumber);
    print(parentOneRealation);
    print(parentOneEmail);
    print(parentOnePhone);
    print(parentTwoRealation);
    print(parentTwoEmail);
    print(parentTwoPhone);
    print(userId);
    print(teacherId);
    print(groupId);
    print(familyCard);
    print(vaccinationCertificate);
    print(document);
    print(actualselectedDate);
    print(relationOnefirstNameController);
    print(relationOneSecondNameController);
    print(relationOneThirdController);
    print(relationTwoFirstController);
    print(relationTwoScecondController);
    print(relationTwoThirdController);
    print(emergencyNameController);
    print(emergencyRelationController);
    print(document.toString());
    print(familyCard.toString());
    PickedFile uploadfamilyCard = PickedFile(familyCard!.path);
    PickedFile uploadvaccinationCertificate =
        PickedFile(vaccinationCertificate!.path);
    PickedFile uploaddocument = PickedFile(document!.path);

    var stream1 =
        // ignore: deprecated_member_use
        new http.ByteStream(
            // ignore: deprecated_member_use
            DelegatingStream.typed(uploadvaccinationCertificate.openRead()));
    var stream2 =
        // ignore: deprecated_member_use
        new http.ByteStream(
            // ignore: deprecated_member_use
            DelegatingStream.typed(uploadfamilyCard.openRead()));
    var stream3 =
        // ignore: deprecated_member_use
        new http.ByteStream(
            // ignore: deprecated_member_use
            DelegatingStream.typed(uploaddocument.openRead()));

    var uri = Uri.parse("$baseApiUrl/addchild");
    var length1 = await familyCard.length();
    var length2 = await vaccinationCertificate.length();
    var length3 = await document.length();
    var request = new http.MultipartRequest(
      "POST",
      uri,
    );

    // request.files.add(new http.MultipartFile.fromBytes('family_card', await familyCard.readAsBytes(), contentType: new MediaType('image', 'jpeg')));
    // request.files.add(new http.MultipartFile.fromBytes('vaccination_certificate', await familyCard.readAsBytes(), contentType: new MediaType('image', 'jpeg')));
    // request.files.add(new http.MultipartFile.fromBytes('document', await familyCard.readAsBytes(), contentType: new MediaType('image', 'jpeg')));

    var multipartFile1 = new http.MultipartFile('family_card', stream1, length1,
        filename: basename(uploadfamilyCard.path));
    var multipartFile2 = new http.MultipartFile(
        'vaccination_certificate', stream2, length2,
        filename: basename(uploadvaccinationCertificate.path));
    var multipartFile3 = new http.MultipartFile('document', stream3, length3,
        filename: basename(uploaddocument.path));

    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);

    request.fields["name"] = childname!;
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

    request.fields["birth_date"] = actualselectedDate!;
    request.fields["relation_one_first_name"] = relationOnefirstNameController!;
    request.fields["relation_one_second_name"] =
        relationOneSecondNameController!;
    request.fields["relation_one_third_name"] = relationOneThirdController!;
    request.fields["relation_two_first_name"] = relationTwoFirstController!;
    request.fields["relation_two_scecond_name"] = relationTwoScecondController!;
    request.fields["relation_two_third_name"] = relationTwoThirdController!;
    request.fields["emergency_name"] = emergencyNameController!;
    request.fields["emergency_relation"] = emergencyRelationController!;

    request.fields["age_group"] = '1';

    request.headers.addAll({
      "Accept": "application/json",
      "Authorization": "Bearer ${GetStorage().read('token')}",
    });

    var response = await request.send();
    print('addchildWeb');
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("From addchild");

      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        Map<String, dynamic> responce = json.decode(value);
        final box = GetStorage();
        print(responce["data"]['id']);

        box.write('addChildId', responce["data"]['id']);
      });
    } else {
      addChilderror = 'Please try again'.tr;
    }
    print(addChilderror);

    // Dio dio = new Dio();

    // FormData formData = FormData.fromMap({
    //   "name": childname,
    //   "gender": gender,
    //   "emergency_number": emergencyNumber,
    //   "parent_one_realation": parentOneRealation,
    //   "parent_one_email": parentOneEmail,
    //   "parent_one_phone": parentOnePhone,
    //   "parent_two_realation": parentTwoRealation,
    //   "parent_two_email": parentTwoEmail,
    //   "parent_two_phone": parentTwoPhone,
    //   "user_id": userId,
    //   "teacher_id": teacherId,
    //   "group_id": groupId,
    //   "family_card":  MultipartFile.fromBytes((await familyCard.readAsBytes())),
    //   "vaccination_certificate":  MultipartFile.fromBytes((await familyCard.readAsBytes())),
    //   "document":  MultipartFile.fromBytes((await familyCard.readAsBytes())),
    //   'birth_date': actualselectedDate,
    //   'relation_one_first_name': relationOnefirstNameController,
    //   'relation_one_second_name': relationOneSecondNameController,
    //   'relation_one_third_name': relationOneThirdController,
    //   'relation_two_first_name': relationTwoFirstController,
    //   'relation_two_scecond_name': relationTwoScecondController,
    //   'relation_two_third_name': relationTwoThirdController,
    //   'emergency_name': emergencyNameController,
    //   'emergency_relation': emergencyRelationController,
    //   'age_group': '1',
    // });

    // Response response = await dio.post(
    //   "$baseApiUrl/addchild",
    //   data: formData,
    //   options: Options(
    //       headers: {
    //         "Authorization": "Bearer ${GetStorage().read('token')}",
    //         "Accept": "application/json",
    //       },
    //       contentType: "application/x-www-form-urlencoded",
    //       followRedirects: false,
    //       validateStatus: (status) {
    //         return status! < 500;
    //       }),
    // );

    // print("addchildMobile");
    // print(response.data);
    // if (response.data['message'] != null) {
    //   addChilderror = 'من فضلك تحقق من بياناتك وحاول مرة اخرى';
    // } else {
    //   User.fromJson(response.data['data']);
    // }

    // return addChilderror;
    return addChilderror;
  }

  static Future<String> sendToken(String token) async {
    var loginError = "";

    Dio dio = new Dio();

    Response response = await dio.post(
      "$baseApiUrl/user/savetoken",
      data: {
        "token": token,
      },
      options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${GetStorage().read('token')}",
          },
          contentType: "application/x-www-form-urlencoded",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    print(response.data);

    return loginError;
  }
}
