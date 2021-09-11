import 'package:bedayat/models/add_child.dart';
import 'package:bedayat/services/add_child_services.dart';
import 'package:get/get.dart';

class AddChildController extends GetxController {
  var addChildList = <AddChild>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchchildern();
  }

  void fetchchildern() async {
    try {
      loadingProcess(true);
      var addchild = await AddChildServices.getAll();
      if (addchild != null) {
        addChildList.value = addchild;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
