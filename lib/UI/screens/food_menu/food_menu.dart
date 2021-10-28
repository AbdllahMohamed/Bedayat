import 'dart:core';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';

// ignore: must_be_immutable
class FoodMenuScreen extends StatefulWidget {
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
          body: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                children: [
                  TabViweItem(label: 'breakfast'.tr),
                  TabViweItem(label: 'lunch'.tr),
                  TabViweItem(label: 'snack'.tr),
                  TabViweItem(label: 'juice or milk'.tr),
                ],
              ),
              ListView(
                children: [
                  TabViweItem(label: 'breakfast'.tr),
                  TabViweItem(label: 'lunch'.tr),
                  TabViweItem(label: 'snack'.tr),
                  TabViweItem(label: 'juice or milk'.tr),
                ],
              ),
              ListView(
                children: [
                  TabViweItem(label: 'breakfast'.tr),
                  TabViweItem(label: 'lunch'.tr),
                  TabViweItem(label: 'snack'.tr),
                  TabViweItem(label: 'juice or milk'.tr),
                ],
              ),
              ListView(
                children: [
                  TabViweItem(label: 'breakfast'.tr),
                  TabViweItem(label: 'lunch'.tr),
                  TabViweItem(label: 'snack'.tr),
                  TabViweItem(label: 'juice or milk'.tr),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabViweItem extends StatelessWidget {
  final String label;
  TabViweItem({
    Key? key,
    required this.label,
  }) : super(key: key);
  _showItem(
      {required BuildContext context,
      required String label,
      required String imagePath}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(''),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
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
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              label,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.accentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () => _showItem(
                  context: context,
                  label: 'Fresh berries juice',
                  imagePath:
                      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Zm9vZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                ),
                child: Padding(
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
                                  'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Zm9vZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
                                  'Saturday',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
