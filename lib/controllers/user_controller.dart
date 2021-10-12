import 'package:bedayat/models/User.dart';
import 'package:bedayat/services/User_services.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var usersList = <User>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchUsers() async {
    try {
      loadingProcess(true);
      var users = await UserServices.getAll();
      if (users != null) {
        usersList.value = users;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
