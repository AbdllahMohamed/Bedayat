import 'package:bedayat/models/report.dart';
import 'package:get/get.dart';
import 'report_services.dart';

class ReportController extends GetxController {
  int childId;
  ReportController({required this.childId});

  RxBool isLoading = false.obs;
  Rx<dynamic> report = Rx<dynamic>(null);

  @override
  void onInit() {
    super.onInit();
    getChildReport(childId: childId);
  }

  getChildReport({required int childId}) async {
    isLoading.value = true;
    report.value = await ReportsServices.getLastChildReport(childId);
    isLoading.value = false;
  }
}
