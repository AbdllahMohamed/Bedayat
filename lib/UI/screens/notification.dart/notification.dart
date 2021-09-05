import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var _devicHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Stack(
              children: [
                Positioned(
                  top: -50,
                  left: -45,
                  bottom: -30,
                  child: Image.asset(
                    AppImages.appCurve,
                    width: 215,
                    height: 500 * 4,
                    fit: BoxFit.fitHeight,
                    color: AppColors.primaryColor,
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
                        onTap: () {},
                        child: Image.asset(
                          AppImages.appNoification,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SizedBox(
                        width: 80,
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
                Positioned(
                  top: 100,
                  right: 20,
                  child: Text(
                    'الإشعارات',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.titleColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 150.0,
                    left: 5,
                    bottom: 25,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                        child: Row(
                          children: [Image.asset(AppImages.appchild)],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*


 Positioned(
                    top: -200,
                    left: -80,
                    bottom: -15,
                    child: Image.asset(
                      AppImages.appCurve,
                      width: 215,
                      height: _devicHeight,
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
                          onTap: () {},
                          child: Image.asset(
                            AppImages.appNoification,
                            width: 20,
                            height: 20,
                          ),
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
                  Positioned(
                    top: 100,
                    right: 20,
                    child: Text(
                      'الإشعارات',
                      style: TextStyle(
                        fontSize: 28,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    right: 20,
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (_, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                            child: Row(
                              children: [Image.asset(AppImages.appchild)],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

 */