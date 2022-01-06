// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportEditorController extends GetxController {
  RxDouble temp = 37.00.obs;
  RxDouble sleep = 0.00.obs;
  final notes = TextEditingController();
  RxList attachments = [].obs;

  RxString childMood = "high".obs;
  changeChildMood(newChildMood) => childMood.value = newChildMood;

  RxString foodStatus = "high".obs;
  changeFoodStatus(newFoodStatus) => foodStatus.value = newFoodStatus;

  RxString drinkStatus = "high".obs;
  changeDrinkStatus(newDrinkStatus) => drinkStatus.value = newDrinkStatus;

  RxString sleepStatus = "high".obs;
  changeSleepStatus(newSleepStatus) => sleepStatus.value = newSleepStatus;

  // files handler
  pickupFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      attachments.value = [...attachments, ...files];
    } else {
      // User canceled the picker
    }
  }

  deleteFiles(File attachment) {
    attachments.remove(attachment);
  }
}
