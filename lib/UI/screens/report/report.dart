import 'dart:core';

import 'package:bedayat/controllers/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:bedayat/UI/screens/report/components/activity.dart';
import 'package:bedayat/UI/screens/report/components/evaluation.dart';
import 'package:bedayat/UI/screens/report/components/gallery.dart';
import 'package:bedayat/UI/screens/report/components/general.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/report_controller.dart';

// ignore: must_be_immutable
class ReportScreen extends StatefulWidget {
  String? name;
  String? classNmber;
  String? image;

  ReportScreen({
    required this.name,
    required this.classNmber,
    required this.image,
  });

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
  final ReportController reportController = Get.put(ReportController());
  final GalleryController galleryController = Get.put(GalleryController());
  TabController? _tabController;
  late ScrollController _scrollController;
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Image.asset(
                          AppImages.appSubLogo,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(widget.image!),
                            radius: 40,
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text(
                                widget.name!,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.titleColor,
                                ),
                              ),
                              Text(
                                ' الفصل ${widget.classNmber!}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.accentColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 25),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.appReport,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: 25),
                            Text(
                              'التقرير',
                              style: TextStyle(
                                fontSize: 25,
                                color: AppColors.titleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TabBar(
                      indicatorColor: AppColors.primaryColor,
                      tabs: [
                        Tab(
                          child: Text(
                            'التقييم',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.titleColor,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'النشاط',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.titleColor,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'عام',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.titleColor,
                            ),
                          ),
                        ),
                        Tab(
                          child: SvgPicture.asset(
                            AppImages.appGallery,
                            width: 25,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Obx(() => reportController.loadingProcess.value
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.accentColor,
                    ),
                  ),
                )
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      EvaluationWidget(
                          newletter: reportController.reportsList[0].newLetter!,
                          knowTheLetter:
                              reportController.reportsList[0].knowTheLetter!,
                          knowTheLetterSound: reportController
                              .reportsList[0].knowtheLetterSound!,
                          masteredWriteLetter: reportController
                              .reportsList[0].masteredWriteLetter!,
                          enjoyWitharkan:
                              reportController.reportsList[0].enjoyWitharkan!,
                          masteredTheActivity: reportController
                              .reportsList[0].masteredTheActivity!,
                          organizeAfterPlay: reportController
                              .reportsList[0].organizeAfterPlay!,
                          enjoyWithArtActivity: reportController
                              .reportsList[0].enjoyWithArtActivity!,
                          helpHimeselfInArtActivity: reportController
                              .reportsList[0].helpHimeselfInArtActivity!,
                          enjoyWithTheStory: reportController
                              .reportsList[0].enjoyWithTheStory!),
                      ActivityWidget(
                        enjoyWithMorningActivity: reportController
                            .reportsList[0].enjoyWithMorningActivity!,
                        loveSharingWithFriends: reportController
                            .reportsList[0].loveSharingWithFriends!,
                        sayWelcome: reportController.reportsList[0].sayWelcome!,
                        enjoyWithhalqa:
                            reportController.reportsList[0].enjoyWithhalqa!,
                        sayWehda: reportController.reportsList[0].sayWehda!,
                        listeningToQuran:
                            reportController.reportsList[0].listeningToQuran!,
                        reapeatAyat:
                            reportController.reportsList[0].reapeatAyat!,
                      ),
                      GeneralWidget(
                        moodSatus: reportController.reportsList[0].moodSatus!,
                        foodStatus: reportController.reportsList[0].foodStatus!,
                        drinkStatus:
                            reportController.reportsList[0].drinkStatus!,
                        sleepStatus:
                            reportController.reportsList[0].sleepStatus!,
                        sleepdration:
                            reportController.reportsList[0].sleepdration!,
                        tempratureDegree:
                            reportController.reportsList[0].tempratureDegree!,
                      ),
                      GalleryWidget(
                        galleryController: galleryController,
                        childId: reportController.reportsList[0].childId!,
                      )
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
