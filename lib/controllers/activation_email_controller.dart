import 'package:bedayat/models/event.dart';
import 'package:bedayat/services/activation_email.dart';
import 'package:bedayat/services/events_services.dart';
import 'package:get/get.dart';

class ActivationEmailController extends GetxController {
  var loadingProcess = false.obs;
  String selectData = '';

  void activationEmail() async {
    try {
      //loadingProcess(true);
      await ActivationEmailServices.activationEmailServices();
    } finally {
      // loadingProcess(false);
    }
  }
}
