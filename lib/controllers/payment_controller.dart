import 'package:bedayat/services/payment_services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var loadingProcess = false.obs;

  Future<String> getCheckoutId({
    String? packageId,
    String? email,
    String? street,
    String? city,
    String? state,
    String? postcode,
    String? givenName,
    String? surname,
    String? paymentMethod,
    String? childId,
  }) async {
    var paymentError = "";
    try {
      loadingProcess(true);
      paymentError = await PaymentServices.getCheckoutId(
        packageId: packageId,
        email: email,
        street: street,
        city: city,
        state: state,
        postcode: postcode,
        givenName: givenName,
        surname: surname,
        paymentMethod: paymentMethod,
        childId: childId,
      );
    } catch (e) {
      print(e);
      paymentError = 'من فضلك حاول مرة اخرى';
    } finally {
      loadingProcess(false);
    }
    return paymentError;
  }
}
