// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'const/const.dart';

showErrorSnackbar({required String message, required String title}) {
  Get.snackbar(
    title,
    message,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    colorText: Colors.white,
    backgroundColor: Colors.red,
    icon: Padding(
      padding: const EdgeInsets.all(10.0),
      child: const FaIcon(
        FontAwesomeIcons.exclamationCircle,
        color: Colors.white,
      ),
    ),
    snackPosition: SnackPosition.BOTTOM,
  );
}

fullImageUrl({shortUrl}) {
  return baseUrl + "/storage/" + shortUrl.toString().split('/')[1];
}

LoadMoreSnackbar() {
  Get.snackbar(
    "Loading More",
    "Wait until get new data ",
    backgroundColor: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    barBlur: 5,
  );
}

NoMoreSnackbar() {
  Get.snackbar(
    "No More",
    "No more Data to load ",
    backgroundColor: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    barBlur: 5,
  );
}
