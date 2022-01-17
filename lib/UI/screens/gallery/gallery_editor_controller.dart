// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:bedayat/UI/screens/children/children_list_screen.dart';
import 'package:bedayat/UI/screens/gallery/gallery_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GalleryEditorController extends GetxController {
  GalleryEditorController({required this.childId});

  final int childId;
  RxList attachments = [].obs;

  DateTime started_at = DateTime.now();

  RxBool isLoading = false.obs;

  // files handler
  pickupFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
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
