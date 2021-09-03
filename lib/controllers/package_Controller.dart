import 'package:bedayat/models/package.dart';
import 'package:bedayat/services/package_services.dart';
import 'package:get/get.dart';

class PackageController extends GetxController {
  var packageList = <Package>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPackages();
  }

  void fetchPackages() async {
    try {
      loadingProcess(true);
      var packages = await PackagesServices.getAll();
      if (packages != null) {
        packageList.value = packages;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
