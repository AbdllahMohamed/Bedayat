import 'package:bedayat/models/food_package.dart';
import 'package:bedayat/services/food_package_services.dart';
import 'package:get/get.dart';

class FoodPackageController extends GetxController {
  var foodPackageList = <FoodPackage>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFoodPackage();
  }

  void getFoodPackage() async {
    try {
      loadingProcess(true);
      var foodPackage = await FoodPackageServices.getFoodPackage();
      if (foodPackage != null) {
        foodPackageList.value = foodPackage;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
