import 'dart:async';
import 'package:bedayat/UI/screens/app_drawer/app_drawer.dart';
import 'package:bedayat/UI/screens/home/components/header_widget.dart';
import 'package:bedayat/UI/screens/home/components/image_slider.dart';
import 'package:bedayat/UI/screens/home/components/mobile_home_content.dart';
import 'package:bedayat/UI/screens/home/components/web_content.dart';
import 'package:bedayat/UI/screens/slider_image_details/sllider_image_details.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/childern_controller.dart';
import 'package:bedayat/controllers/slider_image_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SliderImagesController sliderImagesController =
      Get.put(SliderImagesController());
  final ChildernController childernController = Get.put(ChildernController());
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  CarouselController buttonCarouselController = CarouselController();
  late final PageController controller;
  final scrollController = ScrollController();

  //RangeValues _currentRangeValues = const RangeValues(0, 75);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    childernController.fetchchildern();
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

  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;
    print(_deviceWidth);
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Colors.white,
        drawer: AppDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.all(0),
            child: Stack(
              children: <Widget>[
                HomeHeaderWidget(
                  onTap: () {
                    _scaffoldkey.currentState!.openDrawer();
                  },
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
                                  'Not Found Data'.tr,
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
                                height: kIsWeb ? 300 : 240,
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
                                              "$baseUrl${sliderImagesController.sliderImagesList[index].img!.replaceAll('public', 'storage')}",
                                          title: locale == Locale('en')
                                              ? sliderImagesController
                                                  .sliderImagesList[index]
                                                  .englishContent!
                                              : sliderImagesController
                                                  .sliderImagesList[index]
                                                  .arabicContent!,
                                          description: locale == Locale('en')
                                              ? sliderImagesController
                                                  .sliderImagesList[index]
                                                  .englishContent!
                                              : sliderImagesController
                                                  .sliderImagesList[index]
                                                  .arabicContent!,
                                        ));
                                      },
                                      child: ImageSliderWidget(
                                        imagePath:
                                            "$baseUrl${sliderImagesController.sliderImagesList[index].img!.replaceAll('public', 'storage')}",
                                        imageTitle: locale == Locale('en')
                                            ? sliderImagesController
                                                .sliderImagesList[index]
                                                .englishContent!
                                            : sliderImagesController
                                                .sliderImagesList[index]
                                                .arabicContent!,
                                        imageContent: locale == Locale('en')
                                            ? sliderImagesController
                                                .sliderImagesList[index]
                                                .englishContent!
                                            : sliderImagesController
                                                .sliderImagesList[index]
                                                .arabicContent!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(
                        top: kIsWeb ? 330 : 315.0, right: 180, left: 180),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: kIsWeb ? 440 : 370.0,
                    right: 20,
                    left: 20,
                  ),
                  child: Text(
                    'Children'.tr,
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
                                      'Not Found Data'.tr,
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
                                top: kIsWeb ? 500 : 420.0,
                                left: 5,
                                bottom: 25,
                              ),
                              child: kIsWeb && _deviceWidth > 500
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.only(top: 20),
                                      itemCount: childernController
                                          .childernList.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 15,
                                        childAspectRatio:
                                            _deviceWidth / (_devicHeight / 1.4),
                                      ),
                                      itemBuilder: (BuildContext context, i) {
                                        return HomeWebContentWidget(
                                          name: childernController
                                              .childernList[i].firstName!,
                                          agegroupe: childernController
                                              .childernList[i].ageGroup!,
                                          imagePath:
                                              "$baseUrl${childernController.childernList[i].document!.replaceAll('public', 'storage')}",
                                          childId: childernController
                                              .childernList[i].id!,
                                          createdAt: childernController
                                              .childernList[i].createdAt!,
                                          expireDate: childernController
                                                  .childernList[i].expireDate ??
                                              "null",
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: childernController
                                          .childernList.length,
                                      itemBuilder: (_, i) {
                                        return MobileHomeContentWidget(
                                          name: childernController
                                                  .childernList[i].firstName ??
                                              "",
                                          ageGroup: childernController
                                                  .childernList[i].ageGroup ??
                                              "",
                                          imagePath:
                                              "$baseUrl${childernController.childernList[i].document!.replaceAll('public', 'storage')}",
                                          childId: childernController
                                              .childernList[i].id!,
                                          createdAt: childernController
                                                  .childernList[i].createdAt ??
                                              "",
                                          expireDate: childernController
                                                  .childernList[i].expireDate ??
                                              'null',
                                        );
                                      },
                                    ),
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
