import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities.dart';
import 'offer_services.dart';

class OffersController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isInit = false.obs;
  RxBool isReachForTheLastItem = false.obs;
  RxBool isZeroItems = false.obs;

  var offersList = [].obs;
  var listController = ScrollController();
  int pageNumber = 0;

  getOffers() async {
    if (isReachForTheLastItem.value) {
      NoMoreSnackbar();
      return;
    }

    if (isInit.value) {
      LoadMoreSnackbar();
    } else {
      isLoading.value = true;
    }

    pageNumber = pageNumber + 1;

    var newOffers = await OffersServices.getOffers(pageNumber: pageNumber);

    if (newOffers.length == 0) {
      if (isInit.value == false) {
        isZeroItems.value = true;
      }
      isReachForTheLastItem.value = true;
    }

    offersList.value = [...offersList.value, ...newOffers];

    if (isInit.value) {
    } else {
      isInit.value = true;
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getOffers();

    // Setup the listener.
    listController.addListener(() {
      if (listController.position.atEdge) {
        if (listController.position.pixels == 0) {
          // You're at the top.
        } else {
          getOffers();
        }
      }
    });
  }
}
