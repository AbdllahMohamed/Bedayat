import 'package:bedayat/models/checkout_status.dart';
import 'package:bedayat/models/gallery.dart';
import 'package:bedayat/services/checkout_status_service.dart';
import 'package:bedayat/services/gallery_services.dart';
import 'package:get/get.dart';

class CheckoutStatusController extends GetxController {
  var checkoutstatusCodeList = <CheckoutStatus>[].obs;
  var loadingProcess = false.obs;

  void fetchCheckoutStatusCode(String checkoutId) async {
    try {
      loadingProcess(true);
      var checkoutstatusCode =
          await CheckoutStatusServices.getCheckoutStatusCode(checkoutId);
      if (checkoutstatusCode != null) {
        checkoutstatusCodeList.value = checkoutstatusCode;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
