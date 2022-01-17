// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:bedayat/UI/screens/children/children_list_screen.dart';
import 'package:bedayat/models/Activity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'report_services.dart';

class ReportEditorController extends GetxController {
  ReportEditorController({required this.childId});

  final int childId;
  RxDouble temp = 37.00.obs;
  RxDouble sleep = 0.00.obs;
  final notes = TextEditingController();
  RxList attachments = [].obs;
  RxList activites = [].obs;
  RxList selectedActivites = [].obs;
  RxInt poe = 0.obs;
  RxInt pie = 0.obs;

  incremnetPoeBy(value) => this.poe += value;
  incremnetpieBy(value) => this.pie += value;

  DateTime started_at = DateTime.now();

  RxBool isLoading = false.obs;

  // activities handlers
  toggleActivites(int value) {
    if (selectedActivites.contains(value)) {
      selectedActivites.remove(value);
    } else {
      selectedActivites.add(value);
    }
  }

  // child mood
  RxString childMoodMorning = "high".obs;
  changeChildMoodMorning(newChildMood) => childMoodMorning.value = newChildMood;

  RxString childMoodNoon = "high".obs;
  changeChildMoodNoon(newChildMood) => childMoodNoon.value = newChildMood;

  RxString childMoodAfterNoon = "high".obs;
  changeChildMoodAfterNoon(newChildMood) =>
      childMoodAfterNoon.value = newChildMood;

  // food status

  RxString foodStatusMorning = "high".obs;
  changeFoodStatusMorning(newFoodStatus) =>
      foodStatusMorning.value = newFoodStatus;

  RxString foodStatusNoon = "high".obs;
  changeFoodStatusNoon(newFoodStatus) => foodStatusNoon.value = newFoodStatus;

  RxString foodStatusAfterNoon = "high".obs;
  changeFoodStatusAfterNoon(newFoodStatus) =>
      foodStatusAfterNoon.value = newFoodStatus;

  // drink status

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

  getActivites() async {
    activites.value = await ReportsServices.getActivites();
  }

  uploadHandler(String status) {
    print("$status");
  }

  save() async {
    Get.defaultDialog(
        title: "save".tr,
        content: Column(
          children: [
            Text("theـreportـisـbeingـsentـtoـtheـparent".tr),
            Image.asset("assets/images/rocket_animation.gif")
          ],
        ));

    await ReportsServices.saveReport(
        childMoodMorning: childMoodMorning.value,
        childMoodNoon: childMoodNoon.value,
        childMoodAfterNoon: childMoodAfterNoon.value,
        foodStatusMorning: foodStatusMorning.value,
        foodStatusNoon: foodStatusNoon.value,
        foodStatusAfterNoon: foodStatusAfterNoon.value,
        drinkStatus: drinkStatus.value,
        sleepStatus: sleepStatus.value,
        temp: temp.value,
        sleep: sleep.value,
        notes: notes.text,
        poe: poe.value,
        pie: pie.value,
        selectedActivites: selectedActivites.value,
        attachments: attachments.value,
        started_at: started_at,
        childId: childId,
        uploadHandler: uploadHandler);

    Get.offAll(ChildrenListScreen());
  }

  @override
  void onInit() {
    super.onInit();
    getActivites();
  }
}
