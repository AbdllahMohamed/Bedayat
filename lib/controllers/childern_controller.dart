import 'package:bedayat/models/child.dart';
import 'package:bedayat/services/childern_services.dart';
import 'package:get/get.dart';

class ChildernController extends GetxController {
  var childernList = <Child>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchchildern();
  }

  void fetchchildern() async {
    try {
      loadingProcess(true);
      var children = await ChildrenServices.getAll();
      if (children != null) {
        childernList.value = children;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
