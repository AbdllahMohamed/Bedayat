// ignore_for_file: invalid_use_of_protected_member

import 'package:bedayat/UI/screens/offers/offer_services.dart';
import 'package:bedayat/UI/screens/teacher/teacher_service.dart';
import 'package:bedayat/models/teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utilities.dart';

class TeacherControllerM extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isTeacherDataLoading = false.obs;
  RxBool isSendRatingLoading = false.obs;

  RxBool isUserAbleToRate = false.obs;

  RxBool isInit = false.obs;
  RxBool isReachForTheLastItem = false.obs;
  RxBool isZeroItems = false.obs;

  var ratingsList = [].obs;
  var teacher = Rxn<Teacher?>();
  var listController = ScrollController();
  final TextEditingController comment = TextEditingController();
  int ratenumber = 5;

  int pageNumber = 0;

  getTeacherData() async {
    isTeacherDataLoading.value = true;
    // TODO: pass teacher id not static
    teacher.value = await TeacherServices.getTeacherData(teacher_id: 1);
    // isUserAbleToRate.value = await TeacherServices.userAbleToRate();
    isTeacherDataLoading.value = false;
  }

  addToList(rating) {
    ratingsList.value = [rating, ...ratingsList.value];
  }

  rate({required int rate, required String comment}) async {
    isSendRatingLoading.value = true;
    await TeacherServices.rate(
        rate: rate, comment: comment, successHandler: addToList);
    isSendRatingLoading.value = false;
  }

  showRateForm() {
    Get.defaultDialog(
      title: "Rate teacher".tr,
      actions: [
        TextButton(
            onPressed: () {
              TeacherServices.rate(rate: ratenumber, comment: comment.text);
            },
            child: Text("Rate".tr)),
        TextButton(onPressed: () => Get.back(), child: Text("cancel".tr))
      ],
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            TextFormField(
              controller: comment,
              decoration:
                  const InputDecoration(labelText: 'Enter your your comment'),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.black),
      middleTextStyle: TextStyle(color: Colors.white),
    );
  }

  getRatings() async {
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

    var newRatings =
        await TeacherServices.getRatings(pageNumber: pageNumber, teacher_id: 1);

    if (newRatings.length == 0) {
      if (isInit.value == false) {
        isZeroItems.value = true;
      }
      isReachForTheLastItem.value = true;
    }

    ratingsList.value = [...ratingsList.value, ...newRatings];

    if (isInit.value) {
    } else {
      isInit.value = true;
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    getTeacherData();
    getRatings();

    // Setup the listener.
    listController.addListener(() {
      if (listController.position.atEdge) {
        if (listController.position.pixels == 0) {
          // You're at the top.
        } else {
          getRatings();
        }
      }
    });
  }
}
