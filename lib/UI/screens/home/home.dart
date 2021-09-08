import 'dart:async';
import 'package:bedayat/UI/screens/app_drawer/app_drawer.dart';
import 'package:bedayat/UI/screens/notification.dart/notification.dart';
import 'package:bedayat/UI/screens/report/report.dart';
import 'package:bedayat/UI/screens/slider_image_details/sllider_image_details.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/childern_controller.dart';
import 'package:bedayat/controllers/slider_image_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bedayat/const/const.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SliderImagesController sliderImagesController =
      Get.put(SliderImagesController());
  final ChildernController childernController = Get.put(ChildernController());
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey(); // Create a key

  CarouselController buttonCarouselController = CarouselController();
  late final PageController controller;

  RangeValues _currentRangeValues = const RangeValues(0, 75);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller = PageController(viewportFraction: 1, keepPage: true);
    if (sliderImagesController.sliderImagesList.length > 1) {
      Timer.periodic(Duration(seconds: 2), (Timer timer) {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        if (controller.hasClients) {
          controller.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: <Widget>[
                kIsWeb
                    ? Positioned(
                        top: -200,
                        left: -160,
                        bottom: -200,
                        child: Image.asset(
                          AppImages.appCurve,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Positioned(
                        top: -200,
                        left: -85,
                        bottom: -200,
                        child: SvgPicture.asset(
                          AppImages.appCurveSvg,
                          color: AppColors.primaryColor,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 28.0,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImages.appLogo,
                        width: 106,
                        height: 56,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(NotificationScreen());
                        },
                        child: Image.asset(
                          AppImages.appNoification,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      kIsWeb
                          ? SizedBox(
                              width: 180,
                            )
                          : SizedBox(
                              width: 80,
                            ),
                      InkWell(
                        onTap: () {
                          _scaffoldkey.currentState!.openDrawer();
                        },
                        child: Image.asset(
                          AppImages.appDrawer,
                          width: 18,
                          height: 21,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => sliderImagesController.loadingProcess.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Container(
                            width: _deviceWidth,
                            height: 240,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.accentColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      : sliderImagesController.sliderImagesList.length == 0
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 200.0),
                                child: Text(
                                  'لاتوجد بيانات',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: AppColors.accentColor),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: Container(
                                width: _deviceWidth,
                                height: 240,
                                child: PageView.builder(
                                    allowImplicitScrolling: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: sliderImagesController
                                        .sliderImagesList.length,
                                    controller: controller,
                                    itemBuilder: (_, index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(SliderImageDetails(
                                            imagePath:
                                                "$imagesBaseUrl${sliderImagesController.sliderImagesList[index].img!.replaceAll('public', 'storage')}",
                                            title: sliderImagesController
                                                .sliderImagesList[index].title!,
                                            description: sliderImagesController
                                                .sliderImagesList[index]
                                                .content!,
                                          ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  "$imagesBaseUrl${sliderImagesController.sliderImagesList[index].img!.replaceAll('public', 'storage')}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0x670c0c0c),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              Positioned(
                                                top: 60,
                                                right: 30,
                                                child: Container(
                                                  width: 300,
                                                  child: Text(
                                                    sliderImagesController
                                                        .sliderImagesList[index]
                                                        .title!,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 120,
                                                right: 30,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  width: 350,
                                                  child: Text(
                                                    sliderImagesController
                                                        .sliderImagesList[index]
                                                        .content!,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.only(top: 315.0, right: 180),
                      child: SmoothPageIndicator(
                        controller: controller, // PageController
                        count: sliderImagesController.sliderImagesList.length,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.white,
                          activeDotColor: Colors.white,
                          dotWidth: 9,
                          dotHeight: 11,
                        ),
                        onDotClicked: (index) {},
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 355.0,
                    right: 20,
                  ),
                  child: Text(
                    'الابناء',
                    style: TextStyle(
                      color: AppColors.titleColor,
                      fontSize: 28,
                    ),
                  ),
                ),
                Obx(
                  () => childernController.loadingProcess.value
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
                      : childernController.childernList.length == 0
                          ? Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 450,
                                    ),
                                    child: Text(
                                      'لاتوجد بيانات',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.accentColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: _devicHeight * 0.3,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 420.0,
                                left: 5,
                                bottom: 25,
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      childernController.childernList.length,
                                  itemBuilder: (_, i) {
                                    return Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet<void>(
                                              context: context,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isScrollControlled: true,
                                              builder: (BuildContext context) {
                                                return Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 40),
                                                      width: double.infinity,
                                                      height:
                                                          _devicHeight - 140,
                                                      color: Colors.transparent,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Card(
                                                            color: Colors.white,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: 70,
                                                                    left: 20,
                                                                    right: 20,
                                                                  ),
                                                                  child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        childernController
                                                                            .childernList[i]
                                                                            .name!,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            right:
                                                                                18.0,
                                                                            top:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          'اليوم ${childernController.childernList[i].name!} اداء',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                AppColors.accentColor,
                                                                            fontSize:
                                                                                13,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Directionality(
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                        child:
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
                                                                                min: 1,
                                                                                max: 100,
                                                                                activeColor: Color(0xff22A8A4),
                                                                                focusNode: FocusNode(),
                                                                                inactiveColor: Color(0xffF5F5F5),
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
                                                                        onTap:
                                                                            () {
                                                                          Get.to(
                                                                            ReportScreen(
                                                                              name: childernController.childernList[i].name,
                                                                              classNmber: childernController.childernList[i].ageGroup,
                                                                              image: "$imagesBaseUrl${childernController.childernList[i].document!.replaceAll('public', 'storage')}",
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              320,
                                                                          height:
                                                                              35,
                                                                          alignment:
                                                                              Alignment.center,
                                                                          padding:
                                                                              EdgeInsets.all(8),
                                                                          margin:
                                                                              EdgeInsets.only(
                                                                            right:
                                                                                15,
                                                                            top:
                                                                                15,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: AppColors.primaryColor,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'عرض التقرير اليومى',
                                                                            style:
                                                                                TextStyle(
                                                                              color: AppColors.primaryColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      QrImage(
                                                                        data: childernController
                                                                            .childernList[i]
                                                                            .createdAt!,
                                                                        version:
                                                                            QrVersions.auto,
                                                                        size:
                                                                            200.0,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'مشاركة',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xff818080),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          Image
                                                                              .asset(
                                                                            AppImages.appShareIcon,
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                    circularImageWithBorder(
                                                      imgPath:
                                                          "$imagesBaseUrl${childernController.childernList[i].document!.replaceAll('public', 'storage')}",
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: _deviceWidth,
                                            margin: EdgeInsets.only(
                                                right: 50, top: 15),
                                            padding: EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: const Color(0xffffffff),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                      const Color(0x29a7a6a6),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 45.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 18.0,
                                                            top: 10),
                                                    child: Text(
                                                      childernController
                                                          .childernList[i]
                                                          .name!,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .titleColor,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 18.0,
                                                            top: 5),
                                                    child: Text(
                                                      'اداء ${childernController.childernList[i].name!} اليوم',
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .accentColor,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                  Stack(
                                                    children: [
                                                      SliderTheme(
                                                        data: SliderThemeData(
                                                          trackHeight: 10,
                                                          thumbShape:
                                                              RoundSliderThumbShape(
                                                            enabledThumbRadius:
                                                                6,
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
                                                          min: 0,
                                                          max: 100,
                                                          activeColor:
                                                              Color(0xff22A8A4),
                                                          inactiveColor:
                                                              Color(0xffF5F5F5),
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
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                        right: 15, top: 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Text(
                                                      'عرض التقرير اليومى',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              top: 5),
                                                      child: SvgPicture.asset(
                                                        AppImages
                                                            .appSmallBarcodeSVg,
                                                        width: 30,
                                                        height: 30,
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 60.0, left: 5, right: 5),
                                          child: circularImageWithBorder(
                                            imgPath:
                                                "$imagesBaseUrl${childernController.childernList[i].document!.replaceAll('public', 'storage')}",
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget circularImageWithBorder({String? imgPath}) {
  return CircleAvatar(
    backgroundColor: Colors.transparent,
    backgroundImage: NetworkImage(imgPath!),
    radius: 40,
  );
}
