import 'package:bedayat/models/branch.dart';
import 'package:bedayat/models/group.dart';
import 'package:bedayat/services/group_services.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  var groupList = <Group>[].obs;
  var loadingProcess = false.obs;

  void fetchGroups(int branchId) async {
    try {
      loadingProcess(true);
      var groups = await GroupsServices.getAll(branchId);
      if (groups != null) {
        groupList.value = groups;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
