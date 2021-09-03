import 'package:bedayat/controllers/branch_Controller.dart';
import 'package:bedayat/controllers/group_Controller.dart';
import 'package:bedayat/controllers/package_Controller.dart';
import 'package:bedayat/controllers/teacher_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BranchController>(() => BranchController(), fenix: true);
    Get.lazyPut<GroupController>(() => GroupController(), fenix: true);
    Get.lazyPut<TeacherController>(() => TeacherController(), fenix: true);
    Get.lazyPut<PackageController>(() => PackageController(), fenix: true);
  }
}
