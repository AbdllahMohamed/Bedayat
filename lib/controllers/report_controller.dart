import 'package:bedayat/models/report.dart';
import 'package:bedayat/services/report_services.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var reportsList = <Report>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReports();
  }

  void fetchReports() async {
    try {
      loadingProcess(true);
      var reports = await ReportServices.getAll();
      if (reports != null) {
        reportsList.value = reports;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
