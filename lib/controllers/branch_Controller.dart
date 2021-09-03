import 'package:bedayat/models/branch.dart';
import 'package:bedayat/services/branch_services.dart';
import 'package:get/get.dart';

class BranchController extends GetxController {
  var departmentsList = <Branch>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBranches();
  }

  void fetchBranches() async {
    try {
      loadingProcess(true);
      var departments = await BranchesServices.getAll();
      if (departments != null) {
        departmentsList.value = departments;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
