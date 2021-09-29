import 'dart:ui';
import 'package:bedayat/UI/screens/home/components/mobile_home_content.dart';
import 'package:bedayat/UI/screens/home/components/web_content.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/childern_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ChildernController childernController = Get.put(ChildernController());

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: <Widget>[
                kIsWeb && _deviceWidth >= 825
                    ? Positioned(
                        top: -_devicHeight * 0.25,
                        left: -_deviceWidth * 0.25,
                        bottom: -200,
                        child: Image.asset(
                          AppImages.appCurve,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Positioned(
                        top: -_devicHeight * 0.57,
                        left: -_deviceWidth * 0.4,
                        bottom: -_devicHeight * 0.2,
                        child: SvgPicture.asset(
                          AppImages.appCurveSvg,
                          width: _deviceWidth,
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
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
                  () {
                    return childernController.loadingProcess.value
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
                                      padding: EdgeInsets.only(top: 200.0),
                                      child: Text(
                                        'لاتوجد بيانات',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: AppColors.accentColor),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: _devicHeight * 0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                  top: 150.0,
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
                                          childAspectRatio: _deviceWidth /
                                              (_devicHeight / 1.4),
                                        ),
                                        itemBuilder: (BuildContext context, i) {
                                          return HomeWebContentWidget(
                                            name: childernController
                                                .childernList[i].name!,
                                            agegroupe: childernController
                                                .childernList[i].ageGroup!,
                                            imagePath:
                                                "$baseUrl${childernController.childernList[i].document!.replaceAll('public', 'storage')}",
                                            childId: childernController
                                                .childernList[i].id!,
                                            createdAt: childernController
                                                .childernList[i].createdAt!,
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
                                                .childernList[i].name!,
                                            ageGroup: childernController
                                                .childernList[i].ageGroup!,
                                            imagePath:
                                                "$baseUrl${childernController.childernList[i].document!.replaceAll('public', 'storage')}",
                                            childId: childernController
                                                .childernList[i].id!,
                                            createdAt: childernController
                                                .childernList[i].createdAt!,
                                          );
                                        },
                                      ),
                              );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
