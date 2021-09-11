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
    print('hi1');
    fetchGroups();
    scrollController.addListener(_scrollListner);

    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     print('Perform');
    //   }
    // });
    print('hi2');
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
    // if (scrollController.position.atEdge) {
    //   print('h3');
    //   if (scrollController.position.pixels == 0) {
    //     // You're at the top.
    //     print('top');
    //   } else {
    //     print('bottom');
    //   }
    // }

    // double maxPosition = scrollController.position.maxScrollExtent;
    // double currentPosition = scrollController.position.pixels;

    // /// You can change this value . It's a default value for the
    // /// test if the difference between the great value and the current value is smaller
    // /// or equal
    // double difference = 200.0;

    // /// bottom position
    // if (maxPosition - currentPosition <= difference) {
    //   print('bottom');
    // } else {
    //   print('top');
    // }
  }
}
