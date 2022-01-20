// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:bedayat/UI/screens/report/components/activity.dart';
import 'package:bedayat/UI/screens/report/components/evaluation.dart';
import 'package:bedayat/UI/screens/report/components/general.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/UI/screens/report/report_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ReportScreen extends StatefulWidget {
  int childId;

  ReportScreen({required this.childId});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
  late ReportController reportController;
  TabController? _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    reportController = Get.put(ReportController(childId: widget.childId));
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
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
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0.0, right: 25, left: 25),
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.appReport,
                            color: AppColors.primaryColor,
                            width: 40,
                            height: 50,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'daily_report'.tr,
                            style: TextStyle(
                              fontSize: 23,
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        child: Text(
                          'ُchild_status'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.titleColor,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'attachments'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.titleColor,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'activities'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.titleColor,
                          ),
                        ),
                      ),
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
              ),
            ];
          },
          body: Obx(() => reportController.isLoading.value
              ? RerpotrPlaceHolder()
              : reportController.report.value == null
                  ? Center(
                      child: Text(
                        'Not Found Data'.tr,
                        style: TextStyle(
                            fontSize: 22, color: AppColors.accentColor),
                      ),
                    )
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: 10, top: 20, left: 10),
                          child: SingleChildScrollView(
                            child: childStatus(),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 10, top: 20, left: 10),
                          child: Attachments(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 10, top: 20, left: 10),
                          child: Activities(),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }

  SingleChildScrollView Activities() {
    final locale = Get.locale;

    return SingleChildScrollView(
      child: Column(
        children: [
          ...reportController.report.value.activities
              .map((activitiy) => ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.solidCircle,
                      color: Colors.red,
                    ),
                    title: Text(
                      locale == Locale('en')
                          ? activitiy.englishTitle
                          : activitiy.arabicTitle,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }

  SingleChildScrollView Attachments() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...reportController.report.value.attachments
              .map((attachment) => ListTile(
                    leading: FaIcon(FontAwesomeIcons.file),
                    title: Text(
                      attachment.file.split('.').last,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.titleColor,
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () async => await launch(attachment.file),
                      child: FaIcon(
                        FontAwesomeIcons.download,
                        color: Colors.red,
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }

  Column childStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date".tr +
              " : ${DateFormat('yyyy-MM-dd  kk:mm a').format(DateTime.parse(reportController.report.value.createdAt))}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Divider(),
        Text("notes".tr),
        Text(
          "${reportController.report.value.notes == null ? 'No Notes' : reportController.report.value.notes}",
          style: TextStyle(fontSize: 17),
        ),
        Divider(),

        // child status
        ChildStatusViewer(
            status: reportController.report.value.moodStatusMorning,
            label: "child_mood_morning".tr),
        ChildStatusViewer(
            status: reportController.report.value.moodStatusNoon,
            label: "child_mood_noon".tr),
        ChildStatusViewer(
            status: reportController.report.value.moodStatusAfternoon,
            label: "child_mood_afternoon".tr),
        FoodStatusViewer(
            status: reportController.report.value.foodStatusBreakfast,
            label: "food_status_morning".tr),
        FoodStatusViewer(
            status: reportController.report.value.foodStatusLunch,
            label: "food_status_noon".tr),
        FoodStatusViewer(
            status: reportController.report.value.foodStatusSnak,
            label: "food_status_afternoon".tr),
        DrinkStatusViewer(
            status: reportController.report.value.drinkStatus,
            label: "drink_status".tr),
        SleepStatusViewer(
            status: reportController.report.value.sleepStatus,
            label: "sleep_status".tr),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.stopwatch,
              color: Colors.red,
            ),
            SizedBox(width: 10),
            Text(
              "sleep_dration".tr +
                  " : ${reportController.report.value.sleepDration} " +
                  "minutes".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.temperatureHigh,
              color: Colors.red,
            ),
            SizedBox(width: 10),
            Text(
                "temperature_degree".tr +
                    " : ${reportController.report.value.temperatureDegree} " +
                    "degree".tr,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text("poe_and_pie".tr,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 15,
        ),

        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              ListTile(
                trailing: Text(
                  "${reportController.report.value.poeNumbers}".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Image.asset("assets/images/shitvector.png"),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                trailing: Text(
                  "${reportController.report.value.pieNumbers}".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Image.asset("assets/images/yellow_drop.png"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SleepStatusViewer extends StatelessWidget {
  String status;
  String label;
  SleepStatusViewer({Key? key, required this.status, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ListOfOtions(options: [
          OptionItem(
            image: "assets/images/good_sleep.png",
            label: "good".tr,
            value: "high",
            isSelected: status == "high",
          ),
          OptionItem(
            image: "assets/images/bad_sleep.png",
            label: "sad".tr,
            value: "low",
            isSelected: status == "low",
          ),
        ])
      ],
    );
  }
}

class DrinkStatusViewer extends StatelessWidget {
  String status;
  String label;
  DrinkStatusViewer({Key? key, required this.status, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ListOfOtions(options: [
          OptionItem(
            image: "assets/images/drink_high.png",
            label: "good".tr,
            value: "high",
            isSelected: status == "high",
          ),
          OptionItem(
            image: "assets/images/drink_low.png",
            label: "sad".tr,
            value: "low",
            isSelected: status == "low",
          ),
        ])
      ],
    );
  }
}

class FoodStatusViewer extends StatelessWidget {
  String status;
  String label;
  FoodStatusViewer({Key? key, required this.status, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ListOfOtions(options: [
          OptionItem(
            image: "assets/images/food_high.png",
            label: "good".tr,
            value: "high",
            isSelected: status == "high",
          ),
          OptionItem(
            image: "assets/images/food_medium.png",
            label: "medium".tr,
            value: "medium",
            isSelected: status == "medium",
          ),
          OptionItem(
            image: "assets/images/food_low.png",
            label: "sad".tr,
            value: "low",
            isSelected: status == "low",
          ),
        ])
      ],
    );
  }
}

class ChildStatusViewer extends StatelessWidget {
  String status;
  String label;
  ChildStatusViewer({Key? key, required this.status, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ListOfOtions(options: [
          OptionItem(
            image: "assets/images/good_mood.png",
            label: "good".tr,
            value: "high",
            isSelected: status == "high",
          ),
          OptionItem(
            image: "assets/images/medium_mood.png",
            label: "medium".tr,
            value: "medium",
            isSelected: status == "medium",
          ),
          OptionItem(
            image: "assets/images/bad_mood.png",
            label: "sad".tr,
            value: "low",
            isSelected: status == "low",
          ),
        ])
      ],
    );
  }
}

class ListOfOtions extends StatelessWidget {
  List options;
  ListOfOtions({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [...options],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  String image;
  String label;
  String value;
  bool isSelected;

  OptionItem({
    Key? key,
    required this.image,
    required this.label,
    required this.value,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(
              color: isSelected ? Colors.red : Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 20),
          )
        ],
      ),
    );
  }
}

class RerpotrPlaceHolder extends StatelessWidget {
  const RerpotrPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      enabled: true,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: height * 0.15,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
