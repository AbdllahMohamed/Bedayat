import 'package:bedayat/controllers/add_child_controller.dart';
import 'package:bedayat/controllers/auth_Controller.dart';
import 'package:bedayat/controllers/branch_controller.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';
import 'package:bedayat/controllers/childern_controller.dart';
import 'package:bedayat/controllers/event_controller.dart';
import 'package:bedayat/controllers/group_controller.dart';
import 'package:bedayat/controllers/notification_cotroller.dart';
import 'package:bedayat/controllers/package_controller.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:bedayat/UI/screens/report/report_controller.dart';
import 'package:bedayat/controllers/slider_image_controller.dart';
import 'package:bedayat/controllers/teacher_controller.dart';
import 'package:bedayat/controllers/user_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<ChildernController>(() => ChildernController(), fenix: true);
    Get.lazyPut<AddChildController>(() => AddChildController(), fenix: true);
    Get.lazyPut<EventController>(() => EventController(), fenix: true);
    Get.lazyPut<SliderImagesController>(() => SliderImagesController(),
        fenix: true);
    // Get.lazyPut<ReportController>(() => ReportController(), fenix: true);
    Get.lazyPut<BranchController>(() => BranchController(), fenix: true);
    Get.lazyPut<GroupController>(() => GroupController(), fenix: true);
    Get.lazyPut<TeacherController>(() => TeacherController(), fenix: true);
    Get.lazyPut<PackageController>(() => PackageController(), fenix: true);
    Get.lazyPut<NotificationController>(() => NotificationController(),
        fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
    Get.lazyPut<CheckoutStatusController>(() => CheckoutStatusController(),
        fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
