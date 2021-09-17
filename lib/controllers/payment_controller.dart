import 'package:bedayat/services/payment_services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var loadingProcess = false.obs;

  Future<String> getCheckoutId(String pakageId) async {
    var paymentError = "";
    try {
      loadingProcess(true);
      print("pakageId" + pakageId);
      paymentError = await PaymentServices.getCheckoutId(pakageId);
    } catch (e) {
      print(e);
      paymentError = 'من فضلك حاول مرة اخرى';
    } finally {
      loadingProcess(false);
    }
    return paymentError;
  }
}
