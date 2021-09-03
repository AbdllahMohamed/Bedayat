import 'dart:async';

import 'package:bedayat/UI/screens/account/account.dart';
import 'package:bedayat/UI/screens/profile/profile.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imgList = [
    AppImages.appcarouselImg1,
    'assets/images/slider_Image_1.jpg',
    'assets/images/slider_Image_2.jpg'
  ];
  List<String> titleList = [
    '19 خطوة عملية لغرس الثقة بالنفس لدى الطفل',
    '19 خطوة عملية لغرس الثقة بالنفس لدى الطفل',
    '19 خطوة عملية لغرس الثقة بالنفس لدى الطفل',
  ];
  List<String> subTitlesList = [
    'غرس الثقة بالنفس عند الأطفال، أحد المهام الأساسية للأبوين، التي يحتاج إليها طفلهما بشدة منذ سنوات حياته الأولى، وهو ما يمكن القيام به بمجموعة مختلفة ومتنوعة من الطرق على مدار سنوات نمو الطفل وتطوره، لأن ثقة الطفل بنفسه هي وليدة أحداث ومواقف وردود فعل تجاه تصرفاته',
    'غرس الثقة بالنفس عند الأطفال، أحد المهام الأساسية للأبوين، التي يحتاج إليها طفلهما بشدة منذ سنوات حياته الأولى، وهو ما يمكن القيام به بمجموعة مختلفة ومتنوعة من الطرق على مدار سنوات نمو الطفل وتطوره، لأن ثقة الطفل بنفسه هي وليدة أحداث ومواقف وردود فعل تجاه تصرفاته',
    'غرس الثقة بالنفس عند الأطفال، أحد المهام الأساسية للأبوين، التي يحتاج إليها طفلهما بشدة منذ سنوات حياته الأولى، وهو ما يمكن القيام به بمجموعة مختلفة ومتنوعة من الطرق على مدار سنوات نمو الطفل وتطوره، لأن ثقة الطفل بنفسه هي وليدة أحداث ومواقف وردود فعل تجاه تصرفاته',
  ];

  CarouselController buttonCarouselController = CarouselController();
  late final PageController controller;

  RangeValues _currentRangeValues = const RangeValues(0, 75);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller = PageController(viewportFraction: 1, keepPage: true);

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

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Stack(
              children: <Widget>[
                // Positioned(
                //   top: -200,
                //   left: -80,
                //   bottom: -50,
                //   child: SvgPicture.asset(
                //     AppImages.appCurveSvg,
                //     width: 100,
                //     height: _devicHeight * 4,
                //     fit: BoxFit.fitHeight,
                //   ),
                // ),
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
                      Image.asset(
                        AppImages.appNoification,
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Image.asset(
                        AppImages.appDrawer,
                        width: 18,
                        height: 21,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    width: _deviceWidth,
                    height: 240,
                    child: PageView.builder(
                        allowImplicitScrolling: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: imgList.length,
                        controller: controller,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    imgList[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x670c0c0c),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Positioned(
                                  top: 60,
                                  right: 30,
                                  child: Container(
                                    width: 300,
                                    child: Text(
                                      titleList[index],
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 120,
                                  right: 30,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    width: 350,
                                    child: Text(
                                      subTitlesList[index],
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
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 315.0, right: 180),
                  child: SmoothPageIndicator(
                    controller: controller, // PageController
                    count: imgList.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.white,
                      activeDotColor: Colors.white,
                      dotWidth: 9,
                      dotHeight: 11,
                    ),
                    // your preferred effect
                    onDotClicked: (index) {},
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 420.0,
                    left: 5,
                    bottom: 25,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (_, i) => Stack(
                      children: [
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
                                      height: _devicHeight - 140,
                                      color: Colors.transparent,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                                        "احمد",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 18.0,
                                                                top: 5),
                                                        child: Text(
                                                          'اداء احمد اليوم',
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .accentColor,
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
                                                              data:
                                                                  SliderThemeData(
                                                                trackHeight: 10,
                                                                thumbShape:
                                                                    RoundSliderThumbShape(
                                                                  enabledThumbRadius:
                                                                      6,
                                                                  elevation: 0,
                                                                ),
                                                                overlayShape:
                                                                    RoundSliderOverlayShape(
                                                                  overlayRadius:
                                                                      20.0,
                                                                ),
                                                              ),
                                                              child: Slider(
                                                                value: 75,
                                                                onChanged:
                                                                    (v) {},
                                                                min: 1,
                                                                max: 100,
                                                                activeColor: Color(
                                                                    0xff22A8A4),
                                                                focusNode:
                                                                    FocusNode(),
                                                                inactiveColor:
                                                                    Color(
                                                                        0xffF5F5F5),
                                                              ),
                                                            ),
                                                            Positioned(
                                                                left: 6,
                                                                top: 6,
                                                                child:
                                                                    Container(
                                                                  width: 30,
                                                                  height: 30,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: const Color(
                                                                        0xffffffff),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: const Color(
                                                                            0x29000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            3),
                                                                        blurRadius:
                                                                            6,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Text(
                                                                      _currentRangeValues
                                                                          .end
                                                                          .ceil()
                                                                          .toString()),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // Get.to(
                                                          //     ReportScreen());
                                                        },
                                                        child: Container(
                                                          width: 320,
                                                          height: 35,
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          margin:
                                                              EdgeInsets.only(
                                                            right: 15,
                                                            top: 15,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Text(
                                                            'عرض التقرير اليومى',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Image.asset(
                                                          AppImages.appBarcode),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'مشاركة',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff818080),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Image.asset(
                                                            AppImages
                                                                .appShareIcon,
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
                                      AppImages.appchild,
                                      60,
                                      2,
                                      Colors.black,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 355,
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 18.0, top: 10),
                                    child: Text(
                                      'احمد',
                                      style: TextStyle(
                                        color: AppColors.titleColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 18.0, top: 5),
                                    child: Text(
                                      'اداء احمد اليوم',
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
                                      Positioned(
                                          left: 6,
                                          top: 6,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: const Color(0xffffffff),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                      const Color(0x29000000),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                            ),
                                            child: Text(_currentRangeValues.end
                                                .ceil()
                                                .toString()),
                                          )),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(right: 15, top: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      'عرض التقرير اليومى',
                                      style: TextStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 5),
                                      child: Image.asset(
                                        AppImages.appSmallBarcode,
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
                          padding: const EdgeInsets.only(top: 45.0, left: 5),
                          child: Image.asset(
                            AppImages.appchild,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
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

Widget circularImageWithBorder(
    String imgPath, double rad, double borderWidth, Color borderColor) {
  return CircleAvatar(
    backgroundColor: Colors.transparent,
    backgroundImage: AssetImage(imgPath),
    radius: rad,
  );
}
