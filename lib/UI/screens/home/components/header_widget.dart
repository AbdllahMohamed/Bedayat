import 'package:bedayat/UI/screens/notification.dart/notification.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeaderWidget extends StatelessWidget {
  final VoidCallback onTap;
  HomeHeaderWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: () {
              Get.to(NotificationScreen());
            },
            child: Image.asset(
              AppImages.appNoification,
              width: 20,
              height: 20,
            ),
          ),
          kIsWeb
              ? SizedBox(
                  width: 180,
                )
              : SizedBox(
                  width: 80,
                ),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: Image.asset(
                AppImages.appDrawer,
                width: 18,
                height: 21,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
