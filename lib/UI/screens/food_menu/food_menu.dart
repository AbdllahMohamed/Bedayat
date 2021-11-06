import 'dart:core';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/food_package_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';

// ignore: must_be_immutable
class FoodMenuScreen extends StatefulWidget {
  final int packageId;

  const FoodMenuScreen({Key? key, required this.packageId}) : super(key: key);

  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late ScrollController _scrollController;
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _scrollController = ScrollController();

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await _showDialog();
      foodPackageDetailsController.getFoodPackageDetails(widget.packageId);
    });
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Center(
                child: FaIcon(
                  FontAwesomeIcons.solidHandPointUp,
                  color: AppColors.primaryColor,
                  size: 28,
                ),
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Text('Press the category to see details'.tr),
                    SizedBox(height: 5),
                    ActionButton(
                      label: 'okay I understand'.tr,
                      height: 30,
                      onPressed: () {
                        Get.back();
                      },
                    )
                  ],
                ),
              ),
            ));
  }

  _showItem(
      {required BuildContext context,
      required String label,
      required String labelDescription,
      required String imagePath}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Icon(Icons.close, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imagePath,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    labelDescription,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ));
  }

  final FoodPackageDetailsController foodPackageDetailsController =
      Get.put(FoodPackageDetailsController());

  final locale = Get.locale;
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Row(
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
                      SizedBox(height: 20),
                      Text(
                        "Food Menu".tr,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.titleColor,
                        ),
                      ),
                      Text(
                        "You can see the food menu available for your child".tr,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.accentColor,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "The week".tr,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        child: Text(
                          'First'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Second'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Third'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Fourth'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.w500,
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
          body: Obx(() => foodPackageDetailsController.loadingProcess.value
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 70),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.accentColor,
                      ),
                    ),
                  ),
                )
              : TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'breakfast'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .breakFaskfirstWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .breakFaskfirstWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskfirstWeek[
                                                            index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .breakFaskfirstWeek[
                                                            index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskfirstWeek[
                                                            index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .breakFaskfirstWeek[
                                                            index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.breakFaskfirstWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.breakFaskfirstWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .breakFaskfirstWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .breakFaskfirstWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'lunch'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .lunchfirstWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .lunchfirstWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchfirstWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .lunchfirstWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchfirstWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .lunchfirstWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.lunchfirstWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.lunchfirstWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .lunchfirstWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .lunchfirstWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'juice or milk'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .drinkfirstWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .drinkfirstWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkfirstWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .drinkfirstWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkfirstWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .drinkfirstWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.drinkfirstWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.drinkfirstWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .drinkfirstWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .drinkfirstWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'snack'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .snackFourthWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .snackFourthWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.snackFourthWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.snackFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .snackFourthWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .snackFourthWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'breakfast'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .breakFaskSecondWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .breakFaskSecondWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskSecondWeek[
                                                            index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .breakFaskSecondWeek[
                                                            index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskSecondWeek[
                                                            index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .breakFaskSecondWeek[
                                                            index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.breakFaskSecondWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.breakFaskSecondWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .breakFaskSecondWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .breakFaskSecondWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'lunch'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .lunchSecondWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .lunchSecondWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchSecondWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .lunchSecondWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchSecondWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .lunchSecondWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.lunchSecondWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.lunchSecondWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .lunchSecondWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .lunchSecondWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'juice or milk'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .drinkSecondWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .drinkSecondWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkSecondWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .drinkSecondWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkSecondWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .drinkSecondWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.drinkSecondWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.drinkSecondWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .drinkSecondWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .drinkSecondWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'snack'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .snackSecondWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .snackSecondWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackSecondWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .snackSecondWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackSecondWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .snackSecondWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.snackSecondWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.snackSecondWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .snackSecondWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .snackSecondWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'breakfast'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .breakFaskThirdWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .breakFaskThirdWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskThirdWeek[
                                                            index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .breakFaskThirdWeek[
                                                            index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskThirdWeek[
                                                            index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .breakFaskThirdWeek[
                                                            index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.breakFaskThirdWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.breakFaskThirdWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .breakFaskThirdWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .breakFaskThirdWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'lunch'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .lunchThirdWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .lunchThirdWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchThirdWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .lunchThirdWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchThirdWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .lunchThirdWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.lunchThirdWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.lunchThirdWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .lunchThirdWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .lunchThirdWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'juice or milk'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .drinkThirdWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .drinkThirdWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkThirdWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .drinkThirdWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkThirdWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .drinkThirdWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.drinkThirdWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.drinkThirdWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .drinkThirdWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .drinkThirdWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'snack'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .snackThirdWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .snackThirdWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackThirdWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .snackThirdWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackThirdWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .snackThirdWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.snackThirdWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.snackThirdWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .snackThirdWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .snackThirdWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'breakfast'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .breakFaskFourthWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .breakFaskFourthWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskFourthWeek[
                                                            index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .breakFaskFourthWeek[
                                                            index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .breakFaskFourthWeek[
                                                            index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .breakFaskFourthWeek[
                                                            index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.breakFaskFourthWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.breakFaskFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .breakFaskFourthWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .breakFaskFourthWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'lunch'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .lunchFourthWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .lunchFourthWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchFourthWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .lunchFourthWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .lunchFourthWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .lunchFourthWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.lunchFourthWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.lunchFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .lunchFourthWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .lunchFourthWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'juice or milk'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .drinkFourthWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .drinkFourthWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkFourthWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .drinkFourthWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .drinkFourthWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .drinkFourthWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.drinkFourthWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.drinkFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .drinkFourthWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .drinkFourthWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 0,
                                  top: 0,
                                ),
                                child: Text(
                                  'snack'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodPackageDetailsController
                                      .snackFourthWeek.isEmpty
                                  ? NotFoundFood()
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        itemCount: foodPackageDetailsController
                                            .snackFourthWeek.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _showItem(
                                                context: context,
                                                label: locale == Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .englishTitle
                                                    : foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .arabicTitle,
                                                labelDescription: locale ==
                                                        Locale('en')
                                                    ? foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .englishDescription
                                                    : foodPackageDetailsController
                                                        .snackFourthWeek[index]
                                                        .arabicDescription,
                                                imagePath:
                                                    '$baseUrl${foodPackageDetailsController.snackFourthWeek[index].image.replaceAll('public', 'storage')}',
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              '$baseUrl${foodPackageDetailsController.snackFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            height: 30,
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                              locale ==
                                                                      Locale(
                                                                          'en')
                                                                  ? foodPackageDetailsController
                                                                      .snackFourthWeek[
                                                                          index]
                                                                      .englishTitle
                                                                  : foodPackageDetailsController
                                                                      .snackFourthWeek[
                                                                          index]
                                                                      .arabicTitle,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}

class NotFoundFood extends StatelessWidget {
  const NotFoundFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
          'Not Found Data'.tr,
          style: TextStyle(fontSize: 22, color: AppColors.accentColor),
        ),
      ),
    );
  }
}

class TabViweItem extends StatelessWidget {
  final String label;
  final String imagePath;
  final String day;
  TabViweItem({
    Key? key,
    required this.label,
    required this.imagePath,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
              bottom: 0,
              top: 0,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.accentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primaryColor,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            day,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
