import 'dart:ui';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/notification_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: notificationController.scrollController,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 28.0,
                    right: 15,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Image.asset(
                        AppImages.appSubLogo,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                    right: 20,
                  ),
                  child: Text(
                    'notifications'.tr,
                    style: TextStyle(
                      color: AppColors.titleColor,
                      fontSize: 28,
                    ),
                  ),
                ),
                Obx(
                  () {
                    return notificationController.loadingProcess.value
                        ? Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Container(
                              width: _deviceWidth,
                              height: _devicHeight,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.accentColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : notificationController.notificationList.length == 0
                            ? Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 200.0),
                                      child: Text(
                                        'Not Found Data'.tr,
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: AppColors.accentColor),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: _devicHeight * 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 150.0,
                                    left: 5,
                                    bottom: 25,
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: notificationController
                                        .notificationList.length,
                                    itemBuilder: (_, i) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: const Color(0xffffffff),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0x29a7a6a6),
                                              offset: Offset(0, 3),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            // circularImageWithBorder(
                                            //   imgPath: AppImages.appchild,
                                            // ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  notificationController
                                                      .notificationList[i]
                                                      .title!,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          AppColors.titleColor),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  notificationController
                                                      .notificationList[i]
                                                      .content!,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color:
                                                        AppColors.accentColor,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
