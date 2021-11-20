import 'dart:io';

import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:bedayat/UI/screens/payment/payment.dart';
import 'package:bedayat/UI/screens/report/report.dart';
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
import 'dart:html' as html; //ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js; // ignore: avoid_web_libraries_in_flutter

// ignore: must_be_immutable
class HomeWebContentWidget extends StatelessWidget {
  final String name;
  final String agegroupe;
  final String imagePath;
  final int childId;
  final String createdAt;
  final String expireDate;

  HomeWebContentWidget({
    required this.name,
    required this.agegroupe,
    required this.imagePath,
    required this.childId,
    required this.createdAt,
    required this.expireDate,
  });
  PaymentController paymentController = Get.put(PaymentController());
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: _deviceWidth,
          margin: EdgeInsets.only(right: 50, top: 15),
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
            padding: const EdgeInsets.only(right: 45.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          childEditorController.step.value = 4;
                          Get.to(ChildEditorScreen(routename: 'editChild'));
                        },
                        child: Image.asset(
                          AppImages.appEditIcon,
                          width: 25,
                          height: 25,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, top: 5),
                  child: Text(
                    "${'Perform of'.tr} $name ${'Today'.tr}",
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 13,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 10,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                          elevation: 0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 20.0,
                        ),
                      ),
                      child: Slider(
                        value: 75,
                        onChanged: (v) {},
                        min: 0,
                        max: 100,
                        activeColor: Color(0xff22A8A4),
                        inactiveColor: Color(0xffF5F5F5),
                      ),
                    ),
                    // Positioned(
                    //   left: 6,
                    //   top: 6,
                    //   child: Container(
                    //     width: 30,
                    //     height: 30,
                    //     alignment:
                    //         Alignment.center,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: const Color(
                    //           0xffffffff),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: const Color(
                    //               0x29000000),
                    //           offset:
                    //               Offset(0, 3),
                    //           blurRadius: 6,
                    //         ),
                    //       ],
                    //     ),
                    //     child: Text(
                    //         _currentRangeValues
                    //             .end
                    //             .ceil()
                    //             .toString()),
                    //   ),
                    // ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              width: double.infinity,
                              height: _devicHeight - 100,
                              color: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Card(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 70,
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                name,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18.0, top: 5),
                                                child: Text(
                                                  "${'Perform of'.tr} $name ${'Today'.tr}",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.accentColor,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Stack(
                                                  children: [
                                                    SliderTheme(
                                                      data: SliderThemeData(
                                                        trackHeight: 10,
                                                        thumbShape:
                                                            RoundSliderThumbShape(
                                                          enabledThumbRadius: 6,
                                                          elevation: 0,
                                                        ),
                                                        overlayShape:
                                                            RoundSliderOverlayShape(
                                                          overlayRadius: 20.0,
                                                        ),
                                                      ),
                                                      child: Slider(
                                                        value: 75,
                                                        onChanged: (v) {},
                                                        min: 1,
                                                        max: 100,
                                                        activeColor:
                                                            Color(0xff22A8A4),
                                                        focusNode: FocusNode(),
                                                        inactiveColor:
                                                            Color(0xffF5F5F5),
                                                      ),
                                                    ),
                                                    // Positioned(
                                                    //   left:
                                                    //       6,
                                                    //   top:
                                                    //       6,
                                                    //   child:
                                                    //       Container(
                                                    //     width:
                                                    //         30,
                                                    //     height:
                                                    //         30,
                                                    //     alignment:
                                                    //         Alignment.center,
                                                    //     decoration:
                                                    //         BoxDecoration(
                                                    //       shape: BoxShape.circle,
                                                    //       color: const Color(0xffffffff),
                                                    //       boxShadow: [
                                                    //         BoxShadow(
                                                    //           color: const Color(0x29000000),
                                                    //           offset: Offset(0, 3),
                                                    //           blurRadius: 6,
                                                    //         ),
                                                    //       ],
                                                    //     ),
                                                    //     child:
                                                    //         Text(
                                                    //       _currentRangeValues.end.ceil().toString(),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(
                                                    ReportScreen(
                                                      name: name,
                                                      classNmber: agegroupe,
                                                      image: imagePath,
                                                      childId: childId,
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 320,
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(8),
                                                  margin: EdgeInsets.only(
                                                    right: 15,
                                                    top: 15,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Text(
                                                    'View The Daily Report'.tr,
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              QrImage(
                                                data: createdAt,
                                                version: QrVersions.auto,
                                                size: 200.0,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  screenshotController
                                                      .captureFromWidget(
                                                    Container(
                                                      color: Colors.white,
                                                      child: QrImage(
                                                        data: createdAt,
                                                        version:
                                                            QrVersions.auto,
                                                        size: 190.0,
                                                      ),
                                                    ),
                                                    context: context,
                                                  )
                                                      .then(
                                                          (capturedImage) async {
                                                    // ignore: unnecessary_null_comparison
                                                    if (capturedImage != null) {
                                                      // final directory =
                                                      //     await getApplicationDocumentsDirectory();
                                                      // final imagePath = await File(
                                                      //         '${directory.path}/image.png')
                                                      //     .create();
                                                      // await imagePath
                                                      //     .writeAsBytes(
                                                      //         capturedImage);
                                                      // print(imagePath.path);

                                                      // Share.shareFiles(
                                                      //     [imagePath.path]);

                                                      // await js.context
                                                      //     .callMethod(
                                                      //         "saveAs", [
                                                      //   html.Blob(
                                                      //       [capturedImage]),
                                                      //   'image.png'
                                                      // ]);

                                                      Share.share(
                                                          'Downloads/image.png');
                                                    }
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Share'.tr,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff818080),
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
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            CircleImageWidget(
                              imagePath: imagePath,
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 15, top: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'View The Daily Report'.tr,
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                expireDate == 'null'
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15, top: 5),
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.to(PaymentScreen(
                              childId: childId.toString(),
                              routeName: 'home',
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            minimumSize: Size(
                              _deviceWidth * 0.1,
                              35,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // <-- Radius
                            ),
                          ),
                          child: Text(
                            'Your child is not registered  subscribe now'.tr,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                Align(
                  alignment: Get.locale == Locale('en')
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Image.asset(
                      AppImages.appSmallBarcode,
                      width: 30,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 5, right: 5),
            child: CircleImageWidget(
              imagePath: imagePath,
            )),
      ],
    );
  }
}
