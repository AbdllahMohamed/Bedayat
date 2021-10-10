import 'package:flutter/material.dart';

import 'package:bedayat/app_colors/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
      padding:
          const EdgeInsets.only(top: 25.0, right: 20, bottom: 10, left: 20),
      child: ListView(
        children: [
          Text(
            'language development'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Learn new crafts'.tr,
            value: newletter,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Distinguish the shape of the letter'.tr,
            value: knowTheLetter,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Distinguish the sound of the letter'.tr,
            value: knowTheLetterSound,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Able to write letters'.tr,
            value: masteredWriteLetter,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Cognitive pillars'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Enjoy and immerse with Pillars'.tr,
            value: enjoyWitharkan,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Mastering the activity (Montessori)'.tr,
            value: masteredTheActivity,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Returns toys and tools after completing them'.tr,
            value: organizeAfterPlay,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Artistic activity'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Merges into the Artistic side'.tr,
            value: enjoyWithArtActivity,
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Depends on himself in the Artistic side'.tr,
            value: helpHimeselfInArtActivity,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The Story'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          EvaluationValue(
            label: 'Enjoys hearing the story'.tr,
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
