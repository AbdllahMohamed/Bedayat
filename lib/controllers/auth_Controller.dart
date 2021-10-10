import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/services/auth_services.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  var loadingProcess = false.obs;

  Future<String> login(String email, String password) async {
    var loginError = "";
    try {
      loadingProcess(true);
      loginError = await UsersServices.login(email, password);
    } catch (e) {
      loginError = 'Please try again'.tr;
    } finally {
      loadingProcess(false);
    }
    return loginError;
  }

  Future<String> register({
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
    try {
      loadingProcess(true);
      registerError = await UsersServices.register(
        username: username,
        email: email,
        phone: phone,
        password: password,
        childname: childname,
        ageGroup: ageGroup,
        gender: gender,
        emergencyNumber: emergencyNumber,
        parentOneRealation: parentOneRealation,
        parentOneEmail: parentOneEmail,
        parentOnePhone: parentOnePhone,
        parentTwoRealation: parentTwoRealation,
        parentTwoEmail: parentTwoEmail,
        parentTwoPhone: parentTwoPhone,
        userId: userId,
        teacherId: teacherId,
        groupId: groupId,
        familyCard: familyCard,
        vaccinationCertificate: vaccinationCertificate,
        document: document,
        actualselectedDate: actualselectedDate,
        relationOnefirstNameController: relationOnefirstNameController,
        relationOneSecondNameController: relationOneSecondNameController,
        relationOneThirdController: relationOneThirdController,
        relationTwoFirstController: relationTwoFirstController,
        relationTwoScecondController: relationTwoScecondController,
        relationTwoThirdController: relationTwoThirdController,
        emergencyNameController: emergencyNameController,
        emergencyRelationController: emergencyRelationController,
      );
    } catch (e) {
      print(e);
      registerError = 'Please try again'.tr;
    } finally {
      loadingProcess(false);
    }
    return registerError;
  }

  Future<String> registerWeb({
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
    String? relationOnefirstNameController,
    String? relationOneSecondNameController,
    String? relationOneThirdController,
    String? relationTwoFirstController,
    String? relationTwoScecondController,
    String? relationTwoThirdController,
    String? emergencyNameController,
    String? emergencyRelationController,
    String? birthDate,
  }) async {
    var registerError = "";
    try {
      loadingProcess(true);
      registerError = await UsersServices.registerWeb(
        username: username,
        email: email,
        phone: phone,
        password: password,
        childname: childname,
        ageGroup: ageGroup,
        gender: gender,
        emergencyNumber: emergencyNumber,
        parentOneRealation: parentOneRealation,
        parentOneEmail: parentOneEmail,
        parentOnePhone: parentOnePhone,
        parentTwoRealation: parentTwoRealation,
        parentTwoEmail: parentTwoEmail,
        parentTwoPhone: parentTwoPhone,
        userId: userId,
        teacherId: teacherId,
        groupId: groupId,
        familyCard: familyCard,
        vaccinationCertificate: vaccinationCertificate,
        document: document,
        relationOnefirstNameController: relationOnefirstNameController,
        relationOneSecondNameController: relationOneSecondNameController,
        relationOneThirdController: relationOneThirdController,
        relationTwoFirstController: relationTwoFirstController,
        relationTwoScecondController: relationTwoScecondController,
        relationTwoThirdController: relationTwoThirdController,
        emergencyNameController: emergencyNameController,
        emergencyRelationController: emergencyRelationController,
        birthDate: birthDate,
      );
    } catch (e) {
      print('e');
      print(e);
      registerError = 'Please try again'.tr;
    } finally {
      loadingProcess(false);
    }

    return registerError;
  }

  Future<String> addChild({
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
    try {
      loadingProcess(true);

      registerError = await UsersServices.addchild(
        childname: childname,
        gender: gender,
        emergencyNumber: emergencyNumber,
        parentOneRealation: parentOneRealation,
        parentOneEmail: parentOneEmail,
        parentOnePhone: parentOnePhone,
        parentTwoRealation: parentTwoRealation,
        parentTwoEmail: parentTwoEmail,
        parentTwoPhone: parentTwoPhone,
        userId: userId,
        teacherId: teacherId,
        groupId: groupId,
        checkoutId: checkoutId,
        familyCard: familyCard,
        vaccinationCertificate: vaccinationCertificate,
        document: document,
        actualselectedDate: actualselectedDate,
        relationOnefirstNameController: relationOnefirstNameController,
        relationOneSecondNameController: relationOneSecondNameController,
        relationOneThirdController: relationOneThirdController,
        relationTwoFirstController: relationTwoFirstController,
        relationTwoScecondController: relationTwoScecondController,
        relationTwoThirdController: relationTwoThirdController,
        emergencyNameController: emergencyNameController,
        emergencyRelationController: emergencyRelationController,
      );
    } catch (e) {
      print(e);
      registerError = 'Please try again'.tr;
    } finally {
      loadingProcess(false);
    }
    return registerError;
  }

  void logut() {
    final box = GetStorage();
    box.remove('token');
    Get.offAll(LoginScreen());
  }

  Future<String> addChildWeb({
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
    try {
      loadingProcess(true);
      registerError = await UsersServices.addchildWeb(
        childname: childname,
        gender: gender,
        emergencyNumber: emergencyNumber,
        parentOneRealation: parentOneRealation,
        parentOneEmail: parentOneEmail,
        parentOnePhone: parentOnePhone,
        parentTwoRealation: parentTwoRealation,
        parentTwoEmail: parentTwoEmail,
        parentTwoPhone: parentTwoPhone,
        userId: userId,
        teacherId: teacherId,
        groupId: groupId,
        familyCard: familyCard,
        vaccinationCertificate: vaccinationCertificate,
        document: document,
        actualselectedDate: actualselectedDate,
        relationOnefirstNameController: relationOnefirstNameController,
        relationOneSecondNameController: relationOneSecondNameController,
        relationOneThirdController: relationOneThirdController,
        relationTwoFirstController: relationTwoFirstController,
        relationTwoScecondController: relationTwoScecondController,
        relationTwoThirdController: relationTwoThirdController,
        emergencyNameController: emergencyNameController,
        emergencyRelationController: emergencyRelationController,
      );
    } catch (e) {
      print(e);
      registerError = 'Please try again'.tr;
    } finally {
      loadingProcess(false);
    }
    return registerError;
  }

  void sendToken(String token) async {
    try {
      await UsersServices.sendToken(token);
    } catch (e) {
      print(e);
    } finally {}
  }
}
