import 'package:flutter/material.dart';

import 'package:bedayat/app_colors/app_colors.dart';

// ignore: must_be_immutable
class EvaluationWidget extends StatelessWidget {
  bool newletter;
  bool knowTheLetter;
  bool knowTheLetterSound;
  bool masteredWriteLetter;
  bool enjoyWitharkan;
  bool masteredTheActivity;
  bool organizeAfterPlay;
  bool enjoyWithArtActivity;
  bool helpHimeselfInArtActivity;
  bool enjoyWithTheStory;

  EvaluationWidget({
    Key? key,
    required this.newletter,
    required this.knowTheLetter,
    required this.knowTheLetterSound,
    required this.masteredWriteLetter,
    required this.enjoyWitharkan,
    required this.organizeAfterPlay,
    required this.masteredTheActivity,
    required this.enjoyWithArtActivity,
    required this.helpHimeselfInArtActivity,
    required this.enjoyWithTheStory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 20, bottom: 10),
      child: ListView(
        children: [
          Text(
            'النمو اللغوي',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يتعرف علي الحرف الجديد',
            value: newletter,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يميز شكل الحرف',
            value: knowTheLetter,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يميز صوت الحرف',
            value: knowTheLetterSound,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'متمكن من كتابة الحرف',
            value: masteredWriteLetter,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'الأركان الادراكية',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يستمتع و يندمج بالاركان',
            value: enjoyWitharkan,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يتقن النشاط ( المنتسوري ) ',
            value: masteredTheActivity,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يعيد الالعاب والادوات بعد الانتهاء منها',
            value: organizeAfterPlay,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'النشاط الفني',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يندمج في الركن الفني ',
            value: enjoyWithArtActivity,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يعتمد علي نفسه في الركن الفني',
            value: helpHimeselfInArtActivity,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'القصة',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'يستمتع بسماع القصة',
            value: enjoyWithTheStory,
          )
        ],
      ),
    );
  }
}

class EvaluationValue extends StatelessWidget {
  final String label;
  final bool value;
  EvaluationValue({
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
