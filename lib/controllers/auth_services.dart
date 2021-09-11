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
      loginError = 'من فضلك حاول مرة اخرى';
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
      );
    } catch (e) {
      registerError = 'من فضلك حاول مرة اخرى';
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
    String? groupId,
    XFile? familyCard,
    XFile? vaccinationCertificate,
    XFile? document,
  }) async {
    var registerError = "";
    try {
      loadingProcess(true);

      registerError = await UsersServices.addchild(
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
      );
    } catch (e) {
      print('e');
      print(e);
      registerError = 'من فضلك حاول مرة اخرى';
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
}
