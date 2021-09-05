import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/services/auth_services.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

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
    String? name,
    String? email,
    String? password,
    String? phone,
    String? countryId,
  }) async {
    var registerError = "";
    try {
      loadingProcess(true);
      registerError = await UsersServices.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
        countryId: countryId,
      );
    } catch (e) {
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
