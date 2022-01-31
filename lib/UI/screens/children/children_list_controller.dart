// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities.dart';
import './children_services.dart';

class ChildrenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isInit = false.obs;
  RxBool isReachForTheLastItem = false.obs;
  RxBool isZeroItems = false.obs;

  var childrenList = [].obs;
  var listController = ScrollController();
  int pageNumber = 0;

  refersh() {
    pageNumber = 0;
    childrenList.value = [];
    isLoading.value = false;
    isInit.value = false;
    isReachForTheLastItem.value = false;
    isZeroItems.value = false;
    getChildren();
  }

  getChildren() async {
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

    var newChildren =
        await ChildrenServices.getChildrenForTeacher(pageNumber: pageNumber);

    if (newChildren.length == 0) {
      if (isInit.value == false) {
        isZeroItems.value = true;
      }
      isReachForTheLastItem.value = true;
    }

    childrenList.value = [...childrenList.value, ...newChildren];

    if (isInit.value) {
    } else {
      isInit.value = true;
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getChildren();

    // Setup the listener.
    listController.addListener(() {
      if (listController.position.atEdge) {
        if (listController.position.pixels == 0) {
          // You're at the top.
        } else {
          getChildren();
        }
      }
    });
  }
}
