import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportEditorController extends GetxController {
  RxDouble temp = 37.00.obs;
  RxDouble sleep = 0.00.obs;
  final notes = TextEditingController();

  RxString childMood = "high".obs;
  changeChildMood(newChildMood) => childMood.value = newChildMood;

  RxString foodStatus = "high".obs;
  changeFoodStatus(newFoodStatus) => foodStatus.value = newFoodStatus;

  RxString drinkStatus = "high".obs;
  changeDrinkStatus(newDrinkStatus) => drinkStatus.value = newDrinkStatus;

  RxString sleepStatus = "high".obs;
  changeSleepStatus(newSleepStatus) => sleepStatus.value = newSleepStatus;
}
