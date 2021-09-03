import 'package:bedayat/UI/screens/report/components/activity.dart';
import 'package:bedayat/UI/screens/report/components/evaluation.dart';
import 'package:bedayat/UI/screens/report/components/gallery.dart';
import 'package:bedayat/UI/screens/report/components/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
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
                          Image.asset(AppImages.appchild),
                          Column(
                            children: [
                              Text(
                                'رنا مجدى',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.titleColor,
                                ),
                              ),
                              Text(
                                'الفصل الاول',
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
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: TabBarView(
              controller: _tabController,
              children: [
                EvaluationWidget(),
                ActivityWidget(),
                GeneralWidget(),
                GalleryWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
