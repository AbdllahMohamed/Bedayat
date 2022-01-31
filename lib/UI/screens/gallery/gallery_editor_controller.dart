// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:bedayat/UI/screens/children/children_list_screen.dart';
import 'package:bedayat/UI/screens/gallery/gallery_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utilities.dart';

class GalleryEditorController extends GetxController {
  GalleryEditorController({required this.childId});

  final int childId;
  RxList attachments = [].obs;

  DateTime started_at = DateTime.now();

  RxBool isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  // files handler
  pickupFiles() async {
    // XFile? image =
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      //Most people just handle here. So it never returns anything upon cancel (iOS)
    } else {
      //User canceled the picker. You need do something here, or just add return
      return;
    }
    attachments.add(result);
  }

  deleteFiles(File attachment) {
    attachments.remove(attachment);
  }

  uploadHandler(String status) {
    print("$status");
  }

  save() async {
    GalleryServices.uploadImageOrVideo(
        file: attachments[0], childId: childId.toString());
    Get.offAll(ChildrenListScreen());
  }

  @override
  void onInit() {
    super.onInit();
  }
}
