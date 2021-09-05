import 'package:flutter/material.dart';

import 'package:bedayat/app_colors/app_colors.dart';

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
      padding: const EdgeInsets.only(top: 35.0, right: 20, bottom: 10),
      child: ListView(
        children: [
          Text(
            'النشاط الحركي الصباحي',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'يستمتع بالنشاط الصباحي',
            value: enjoyWithMorningActivity!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'يحي المشاركة مع الإصدقاء',
            value: loveSharingWithFriends!,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'الحلقة',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'يلقي تحية السلام و يرد السلام',
            value: sayWelcome!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'يستمتع بالحلقة و يشارك فيها',
            value: enjoyWithhalqa!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'يردد انشودة الوحدة',
            value: sayWehda!,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'القران الكريم',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'يستمتع و ينصت',
            value: listeningToQuran!,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityValue(
            label: 'يردد الايات',
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
