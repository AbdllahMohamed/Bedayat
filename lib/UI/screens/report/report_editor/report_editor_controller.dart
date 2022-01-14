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

  RxBool isLoading = false.obs;

  /// activities values

  RxBool enjoy_with_morning_activity = false.obs;
  RxBool love_sharing_with_friends = false.obs;
  RxBool say_welcome = false.obs;
  RxBool enjoy_with_halqa = false.obs;
  RxBool say_wehda = false.obs;
  RxBool listening_to_quran = false.obs;
  RxBool repeat_ayat = false.obs;
  RxBool new_letter = false.obs;
  RxBool know_the_letter = false.obs;
  RxBool know_the_letter_sound = false.obs;
  RxBool mastered_write_letter = false.obs;
  RxBool enjoy_with_arkan = false.obs;
  RxBool orgnize_after_play = false.obs;
  RxBool mastered_the_activity = false.obs;
  RxBool enjoy_with_art_activity = false.obs;
  RxBool help_himself_in_art_activity = false.obs;
  RxBool enjoy_with_the_story = false.obs;

  // activities handlers

  change_enjoy_with_morning_activity(value) =>
      enjoy_with_morning_activity.value = value;

  change_love_sharing_with_friends(value) =>
      love_sharing_with_friends.value = value;

  change_say_welcome(value) => say_welcome.value = value;

  change_say_wehda(value) => say_wehda.value = value;

  change_enjoy_with_halqa(value) => enjoy_with_halqa.value = value;

  change_listening_to_quran(value) => listening_to_quran.value = value;

  change_repeat_ayat(value) => repeat_ayat.value = value;

  change_new_letter(value) => new_letter.value = value;

  change_know_the_letter(value) => know_the_letter.value = value;

  change_know_the_letter_sound(value) => know_the_letter_sound.value = value;

  change_mastered_write_letter(value) => mastered_write_letter.value = value;

  change_enjoy_with_arkan(value) => enjoy_with_arkan.value = value;

  change_orgnize_after_play(value) => orgnize_after_play.value = value;

  change_mastered_the_activity(value) => mastered_the_activity.value = value;

  change_enjoy_with_art_activity(value) =>
      enjoy_with_art_activity.value = value;

  change_help_himself_in_art_activity(value) =>
      help_himself_in_art_activity.value = value;

  change_enjoy_with_the_story(value) => enjoy_with_the_story.value = value;

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

  save() {
    Get.defaultDialog(
        title: "save".tr,
        // middleText: ,
        content: Column(
          children: [
            Text("theـreportـisـbeingـsentـtoـtheـparent".tr),
            Image.asset("assets/images/rocket_animation.gif")
          ],
        ));
    print("test");
  }
}
