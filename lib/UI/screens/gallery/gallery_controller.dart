import 'package:bedayat/UI/screens/gallery/gallery_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities.dart';

class GalleryController extends GetxController {
  final int childId;

  GalleryController({required this.childId});

  RxBool isLoading = false.obs;
  RxBool isInit = false.obs;
  RxBool isReachForTheLastItem = false.obs;
  RxBool isZeroItems = false.obs;

  var galleryList = [].obs;
  var listController = ScrollController();
  int pageNumber = 0;

  getGallery() async {
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

    var newGallery = await GalleryServices.getGallery(
        pageNumber: pageNumber, childId: childId);

    if (newGallery.length == 0) {
      if (isInit.value == false) {
        isZeroItems.value = true;
      }
      isReachForTheLastItem.value = true;
    }

    galleryList.value = [...galleryList.value, ...newGallery];

    if (isInit.value) {
    } else {
      isInit.value = true;
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getGallery();
    // Setup the listener.
    listController.addListener(() {
      if (listController.position.atEdge) {
        if (listController.position.pixels == 0) {
          // You're at the top.
        } else {
          getGallery();
        }
      }
    });
  }
}
