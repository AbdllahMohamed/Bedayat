import 'package:bedayat/models/notification.dart';
import 'package:bedayat/services/notification_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notificationList = <Notifications>[].obs;
  var loadingProcess = false.obs;
  final scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    fetchGroups();
    scrollController.addListener(_scrollListner);
  }

  void fetchGroups() async {
    try {
      loadingProcess(true);
      var notifications = await NotificationsServices.getAll();
      if (notifications != null) {
        notificationList.value = notifications;
      }
    } finally {
      loadingProcess(false);
    }
  }

  void _scrollListner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print("----------");
    }
  }
}
