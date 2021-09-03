import 'package:bedayat/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({Key? key}) : super(key: key);

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
          PositiveActivity(
            label: 'يستمتع بالنشاط الصباحي',
          ),
          SizedBox(
            height: 15,
          ),
          NegativeActivity(
            label: 'يحي المشاركة مع الإصدقاء',
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
          PositiveActivity(
            label: 'يلقي تحية السلام و يرد السلام',
          ),
          SizedBox(
            height: 15,
          ),
          PositiveActivity(
            label: 'يستمتع بالحلقة و يشارك فيها',
          ),
          SizedBox(
            height: 15,
          ),
          PositiveActivity(
            label: 'يردد انشودة الوحدة',
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
          PositiveActivity(
            label: 'يستمتع و يتصت',
          ),
          SizedBox(
            height: 15,
          ),
          PositiveActivity(
            label: 'يردد الايات',
          ),
        ],
      ),
    );
  }
}

class NegativeActivity extends StatelessWidget {
  final String label;
  NegativeActivity({
    required this.label,
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
        Expanded(
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

class PositiveActivity extends StatelessWidget {
  final String label;
  PositiveActivity({
    required this.label,
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
        Expanded(
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
