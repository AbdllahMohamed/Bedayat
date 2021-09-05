import 'package:bedayat/models/event.dart';
import 'package:bedayat/services/events_services.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  var eventsList = <Event>[].obs;
  var loadingProcess = false.obs;
  String selectData = '';

  @override
  void onInit() {
    super.onInit();
    fetchEvents(selectData);
  }

  void fetchEvents(String selectData) async {
    try {
      loadingProcess(true);
      var events = await EventsServices.getAll(selectData);
      if (events != null) {
        eventsList.value = events;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
