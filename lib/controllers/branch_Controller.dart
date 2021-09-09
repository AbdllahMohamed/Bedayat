import 'package:bedayat/models/branch.dart';
import 'package:bedayat/services/branch_services.dart';
import 'package:get/get.dart';

class BranchController extends GetxController {
  var branchsList = <Branch>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBranches();
  }

  void fetchBranches() async {
    try {
      loadingProcess(true);
      var branches = await BranchesServices.getAll();
      if (branches != null) {
        branchsList.value = branches;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
