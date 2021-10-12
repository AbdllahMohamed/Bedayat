import 'package:bedayat/services/reset_password.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var loadingProcess = false.obs;

  Future<String> resetPassword(String email) async {
    try {
      loadingProcess(true);
      var message = await ResetPasswordServices.reset(email);
      return message;
    } finally {
      loadingProcess(false);
    }
  }
}
