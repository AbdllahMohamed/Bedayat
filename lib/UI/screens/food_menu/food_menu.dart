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
import 'package:cached_network_image/cached_network_image.dart';

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
                      height: MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      labelDescription,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  final FoodPackageDetailsController foodPackageDetailsController =
      Get.put(FoodPackageDetailsController());
  bool _isExpandedBreakFaskfirstWeek = false;
  bool _isExpandedLunchfirstWeek = false;
  bool _isExpandedDrinkfirstWeek = false;
  bool _isExpandedSnackfirstWeek = false;
  bool _isExpandedBreakFasksecondWeek = false;
  bool _isExpandedLunchsecondWeek = false;
  bool _isExpandedDrinksecondWeek = false;
  bool _isExpandedSnacksecondWeek = false;
  bool _isExpandedBreakFaskThirdWeek = false;
  bool _isExpandedLunchThirdWeek = false;
  bool _isExpandedDrinkThirdWeek = false;
  bool _isExpandedSnackThirdWeek = false;
  bool _isExpandedBreakFaskFouththWeek = false;
  bool _isExpandedLunchFouththWeek = false;
  bool _isExpandedDrinkFouththWeek = false;
  bool _isExpandedSnackFouththWeek = false;

  final locale = Get.locale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        isAlwaysShown: true,
        child: SafeArea(
          child: NestedScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
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
                          "You can see the food menu available for your child"
                              .tr,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'breakfast'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .breakFaskfirstWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .breakFaskfirstWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.breakFaskfirstWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskfirstWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .breakFaskfirstWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskfirstWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .breakFaskfirstWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedBreakFaskfirstWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedBreakFaskfirstWeek =
                                    !_isExpandedBreakFaskfirstWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'lunch'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .lunchfirstWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .lunchfirstWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchfirstWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .lunchfirstWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchfirstWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .lunchfirstWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.lunchfirstWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.lunchfirstWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchfirstWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .lunchfirstWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchfirstWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .lunchfirstWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedLunchfirstWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedLunchfirstWeek =
                                    !_isExpandedLunchfirstWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'juice or milk'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .drinkfirstWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .drinkfirstWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkfirstWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .drinkfirstWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkfirstWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .drinkfirstWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.drinkfirstWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.drinkfirstWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkfirstWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .drinkfirstWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkfirstWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .drinkfirstWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedDrinkfirstWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedDrinkfirstWeek =
                                    !_isExpandedDrinkfirstWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'snack'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .snackfirstWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .snackfirstWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackfirstWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .snackfirstWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackfirstWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .snackfirstWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.snackfirstWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.snackfirstWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackfirstWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .snackfirstWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackfirstWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .snackfirstWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedSnackfirstWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedSnackfirstWeek =
                                    !_isExpandedSnackfirstWeek;
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                      ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'breakfast'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .breakFaskSecondWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .breakFaskSecondWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.breakFaskSecondWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskSecondWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .breakFaskSecondWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskSecondWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .breakFaskSecondWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedBreakFasksecondWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedBreakFasksecondWeek =
                                    !_isExpandedBreakFasksecondWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'lunch'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .lunchSecondWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .lunchSecondWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchSecondWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .lunchSecondWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchSecondWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .lunchSecondWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.lunchSecondWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.lunchSecondWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchSecondWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .lunchSecondWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchSecondWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .lunchSecondWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedLunchsecondWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedLunchsecondWeek =
                                    !_isExpandedLunchsecondWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'juice or milk'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .drinkSecondWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .drinkSecondWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkSecondWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .drinkSecondWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkSecondWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .drinkSecondWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.drinkSecondWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.drinkSecondWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkSecondWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .drinkSecondWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkSecondWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .drinkSecondWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedDrinksecondWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedDrinksecondWeek =
                                    !_isExpandedDrinksecondWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'snack'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .snackSecondWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .snackSecondWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackSecondWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .snackSecondWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackSecondWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .snackSecondWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.snackSecondWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.snackSecondWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackSecondWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .snackSecondWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackSecondWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .snackSecondWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedSnacksecondWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedSnacksecondWeek =
                                    !_isExpandedSnacksecondWeek;
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                      ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'breakfast'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .breakFaskThirdWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .breakFaskThirdWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.breakFaskThirdWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskThirdWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .breakFaskThirdWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskThirdWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .breakFaskThirdWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedBreakFaskThirdWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedBreakFaskThirdWeek =
                                    !_isExpandedBreakFaskThirdWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'lunch'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .lunchThirdWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .lunchThirdWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchThirdWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .lunchThirdWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchThirdWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .lunchThirdWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.lunchThirdWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.lunchThirdWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchThirdWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .lunchThirdWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchThirdWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .lunchThirdWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedLunchThirdWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedLunchThirdWeek =
                                    !_isExpandedLunchThirdWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'juice or milk'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .drinkThirdWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .drinkThirdWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkThirdWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .drinkThirdWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkThirdWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .drinkThirdWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.drinkThirdWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.drinkThirdWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkThirdWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .drinkThirdWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkThirdWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .drinkThirdWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedDrinkThirdWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedDrinkThirdWeek =
                                    !_isExpandedDrinkThirdWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'snack'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .snackThirdWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .snackThirdWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackThirdWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .snackThirdWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackThirdWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .snackThirdWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.snackThirdWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.snackThirdWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackThirdWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .snackThirdWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackThirdWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .snackThirdWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedSnackThirdWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedSnackThirdWeek =
                                    !_isExpandedSnackThirdWeek;
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                      ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'breakfast'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .breakFaskFourthWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .breakFaskFourthWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.breakFaskFourthWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskFourthWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .breakFaskFourthWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .breakFaskFourthWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .breakFaskFourthWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedBreakFaskFouththWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedBreakFaskFouththWeek =
                                    !_isExpandedBreakFaskFouththWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'lunch'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .lunchFourthWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .lunchFourthWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchFourthWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .lunchFourthWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .lunchFourthWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .lunchFourthWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.lunchFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.lunchFourthWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchFourthWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .lunchFourthWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .lunchFourthWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .lunchFourthWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedLunchFouththWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedLunchFouththWeek =
                                    !_isExpandedLunchFouththWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'juice or milk'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .drinkFourthWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .drinkFourthWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkFourthWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .drinkFourthWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .drinkFourthWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .drinkFourthWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.drinkFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.drinkFourthWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkFourthWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .drinkFourthWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .drinkFourthWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .drinkFourthWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedDrinkFouththWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedDrinkFouththWeek =
                                    !_isExpandedDrinkFouththWeek;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 500),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'snack'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  },
                                  body: foodPackageDetailsController
                                          .snackFourthWeek.isEmpty
                                      ? NotFoundFood()
                                      : Container(
                                          height: 300,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            itemCount:
                                                foodPackageDetailsController
                                                    .snackFourthWeek.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _showItem(
                                                    context: context,
                                                    label: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackFourthWeek[
                                                                index]
                                                            .englishTitle
                                                        : foodPackageDetailsController
                                                            .snackFourthWeek[
                                                                index]
                                                            .arabicTitle,
                                                    labelDescription: locale ==
                                                            Locale('en')
                                                        ? foodPackageDetailsController
                                                            .snackFourthWeek[
                                                                index]
                                                            .englishDescription
                                                        : foodPackageDetailsController
                                                            .snackFourthWeek[
                                                                index]
                                                            .arabicDescription,
                                                    imagePath:
                                                        '$baseUrl${foodPackageDetailsController.snackFourthWeek[index].image.replaceAll('public', 'storage')}',
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "$baseUrl${foodPackageDetailsController.snackFourthWeek[index].image.replaceAll('public', 'storage')}",
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackFourthWeek[
                                                                        index]
                                                                    .englishTitle
                                                                : foodPackageDetailsController
                                                                    .snackFourthWeek[
                                                                        index]
                                                                    .arabicTitle,
                                                          ),
                                                          Text(
                                                            locale ==
                                                                    Locale('en')
                                                                ? foodPackageDetailsController
                                                                    .snackFourthWeek[
                                                                        index]
                                                                    .englishDescription
                                                                : foodPackageDetailsController
                                                                    .snackFourthWeek[
                                                                        index]
                                                                    .arabicDescription,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  isExpanded: _isExpandedSnackFouththWeek,
                                  canTapOnHeader: true,
                                ),
                              ],
                              expansionCallback: (panelIndex, isExpanded) {
                                _isExpandedSnackFouththWeek =
                                    !_isExpandedSnackFouththWeek;
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
          ),
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
