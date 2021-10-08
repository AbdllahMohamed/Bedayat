import 'package:flutter/material.dart';

import 'package:bedayat/app_colors/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ActivityWidget extends StatelessWidget {
  final bool? enjoyWithMorningActivity;
  final bool? loveSharingWithFriends;
  final bool? sayWelcome;
  final bool? enjoyWithhalqa;
  final bool? sayWehda;
  final bool? listeningToQuran;
  final bool? reapeatAyat;
  const ActivityWidget({
    Key? key,
    this.enjoyWithMorningActivity,
    this.loveSharingWithFriends,
    this.sayWelcome,
    this.enjoyWithhalqa,
    this.sayWehda,
    this.listeningToQuran,
    this.reapeatAyat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 35.0, right: 20, left: 20, bottom: 10),
      child: ListView(
        children: [
          Text(
            'Morning physical activity'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'Enjoying the morning activity'.tr,
            value: enjoyWithMorningActivity!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'Likes to share with friends'.tr,
            value: loveSharingWithFriends!,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'the Party'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'Say hello to peace and return peace'.tr,
            value: sayWelcome!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'Enjoy and take part in the party'.tr,
            value: enjoyWithhalqa!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'He sings the chant of unity'.tr,
            value: sayWehda!,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The Holy Quran'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'enjoy and listen'.tr,
            value: listeningToQuran!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'repeating the verses'.tr,
            value: reapeatAyat!,
          ),
        ],
      ),
    );
  }
}

class ActivityValue extends StatelessWidget {
  final String label;
  final bool value;
  ActivityValue({
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.accentColor,
            ),
          ),
        ),
        value
            ? Expanded(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : Expanded(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
