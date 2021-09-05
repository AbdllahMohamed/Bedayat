import 'package:bedayat/controllers/auth_services.dart';
import 'package:bedayat/controllers/branch_Controller.dart';
import 'package:bedayat/controllers/childern_controller.dart';
import 'package:bedayat/controllers/event_Controller.dart';
import 'package:bedayat/controllers/gallery_controller.dart';
import 'package:bedayat/controllers/group_Controller.dart';
import 'package:bedayat/controllers/package_Controller.dart';
import 'package:bedayat/controllers/report_controller.dart';
import 'package:bedayat/controllers/slider_image_controller.dart';
import 'package:bedayat/controllers/teacher_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<ChildernController>(() => ChildernController(), fenix: true);
    Get.lazyPut<EventController>(() => EventController(), fenix: true);
    Get.lazyPut<GalleryController>(() => GalleryController(), fenix: true);
    Get.lazyPut<SliderImagesController>(() => SliderImagesController(),
        fenix: true);
    Get.lazyPut<ReportController>(() => ReportController(), fenix: true);
    Get.lazyPut<BranchController>(() => BranchController(), fenix: true);
    Get.lazyPut<GroupController>(() => GroupController(), fenix: true);
    Get.lazyPut<TeacherController>(() => TeacherController(), fenix: true);
    Get.lazyPut<PackageController>(() => PackageController(), fenix: true);
  }
}