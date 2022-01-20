import 'dart:io';
import 'dart:ui';
import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:bedayat/UI/screens/gallery/gallery_screen.dart';
import 'package:bedayat/UI/screens/payment/payment.dart';
import 'package:bedayat/UI/screens/report/report.dart';
import 'package:bedayat/UI/screens/teacher/teacher_screen.dart';
import 'package:bedayat/UI/widgets/circle_image.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MobileHomeContentWidget extends StatelessWidget {
  final String name;
  final String ageGroup;
  final String imagePath;
  final int childId;
  final String createdAt;
  final String expireDate;
  final bool isActive;

  MobileHomeContentWidget(
      {required this.name,
      required this.ageGroup,
      required this.imagePath,
      required this.childId,
      required this.createdAt,
      required this.expireDate,
      required this.isActive});

  PaymentController paymentController = Get.put(PaymentController());

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: _deviceWidth - 20,
          margin: EdgeInsets.only(left: 10, right: 10, top: 15),
          padding: EdgeInsets.only(
            bottom: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29a7a6a6),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleImageWidget(
                    imagePath: imagePath,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 18.0, top: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        childEditorController.step.value = 4;
                        Get.to(
                          ChildEditorScreen(
                            routename: 'editChild',
                            childId: childId.toString(),
                          ),
                        );
                      },
                      child: Image.asset(
                        AppImages.appEditIcon,
                        width: 25,
                        height: 25,
                      ),
                    )
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30, right: 25.0, top: 5),
                //   child: Text(
                //     "${'Perform of'.tr} $name ${'Today'.tr}",
                //     style: TextStyle(
                //       color: AppColors.accentColor,
                //       fontSize: 13,
                //     ),
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.only(right: 15, left: 15),
                //   child: SliderTheme(
                //     data: SliderThemeData(
                //       trackHeight: 10,
                //       thumbShape: RoundSliderThumbShape(
                //         enabledThumbRadius: 6,
                //         elevation: 0,
                //       ),
                //       overlayShape: RoundSliderOverlayShape(
                //         overlayRadius: 20.0,
                //       ),
                //     ),
                //     child: Slider(
                //       value: 75,
                //       onChanged: (v) {},
                //       min: 0,
                //       max: 100,
                //       activeColor: Color(0xff22A8A4),
                //       inactiveColor: Color(0xffF5F5F5),
                //     ),
                //   ),
                // ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              ReportScreen(
                                childId: childId,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'View The Daily Report'.tr,
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              GalleryScreen(
                                childId: childId,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Gallery'.tr,
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ignore: unnecessary_null_comparison
                expireDate != null
                    ? Center(
                        child: Text(
                          "expires_at".tr +
                              " : ${DateFormat('yyyy-MM-dd').format(DateTime.parse(expireDate))}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 2),
                          child: ElevatedButton(
                            onPressed: () async {
                              Get.to(PaymentScreen(
                                childId: childId.toString(),
                                routeName: 'home',
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8), // <-- Radius
                              ),
                            ),
                            child: Text(
                              'Your child is not registered  subscribe now'.tr,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                // InkWell(
                //   onTap: () {
                //     Get.to(
                //       TeacherScreen(
                //           // name: name,
                //           // classNmber: ageGroup,
                //           // image: imagePath,
                //           // childId: childId,
                //           ),
                //     );
                //   },
                //   child: Container(
                //     padding: EdgeInsets.all(5),
                //     margin: EdgeInsets.only(left: 30, right: 30, top: 5),
                //     decoration: BoxDecoration(
                //         border: Border.all(
                //           color: AppColors.primaryColor,
                //         ),
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Text(
                //       'View Teacher Profile'.tr,
                //       style: TextStyle(color: AppColors.primaryColor),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 15,
                ),
                !isActive
                    ? SizedBox()
                    : Center(
                        child: QrImage(
                          data: createdAt,
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),

                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    screenshotController
                        .captureFromWidget(
                      Container(
                        color: Colors.white,
                        child: QrImage(
                          data: createdAt,
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      context: context,
                    )
                        .then((capturedImage) async {
                      // ignore: unnecessary_null_comparison
                      if (capturedImage != null) {
                        final directory =
                            await getApplicationDocumentsDirectory();
                        final imagePath =
                            await File('${directory.path}/image.png').create();
                        await imagePath.writeAsBytes(capturedImage);
                        print(imagePath.path);

                        Share.shareFiles([imagePath.path]);
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Share'.tr,
                        style: TextStyle(
                          color: Color(0xff818080),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        AppImages.appShareIcon,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
