import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class GeneralWidget extends StatelessWidget {
  final String? moodSatus;
  final String? foodStatus;
  final String? drinkStatus;
  final String? sleepStatus;
  final int? sleepdration;
  final String? tempratureDegree;
  const GeneralWidget({
    Key? key,
    this.moodSatus,
    this.foodStatus,
    this.drinkStatus,
    this.sleepStatus,
    this.sleepdration,
    this.tempratureDegree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(foodStatus);
    return Padding(
      padding:
          const EdgeInsets.only(top: 25.0, right: 20, left: 20, bottom: 10),
      child: ListView(
        children: [
          Text(
            'Child Mood'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MoodSatusItem(
              label: 'morning'.tr,
              firstImagePath: moodSatus == 'low'
                  ? AppImages.appHappyColored
                  : AppImages.appHappyNormal,
              secondImagePath: moodSatus == 'medium'
                  ? AppImages.appSilentColored
                  : AppImages.appSilentNormal,
              thirdImagePath: moodSatus == 'high'
                  ? AppImages.appSadColored
                  : AppImages.appSadNormal),
          SizedBox(
            height: 15,
          ),
          MoodSatusItem(
              label: 'noon'.tr,
              firstImagePath: moodSatus == 'low'
                  ? AppImages.appHappyColored
                  : AppImages.appHappyNormal,
              secondImagePath: moodSatus == 'medium'
                  ? AppImages.appSilentColored
                  : AppImages.appSilentNormal,
              thirdImagePath: moodSatus == 'high'
                  ? AppImages.appSadColored
                  : AppImages.appSadNormal),
          SizedBox(
            height: 15,
          ),
          MoodSatusItem(
              label: 'afternoon time'.tr,
              firstImagePath: moodSatus == 'low'
                  ? AppImages.appHappyColored
                  : AppImages.appHappyNormal,
              secondImagePath: moodSatus == 'medium'
                  ? AppImages.appSilentColored
                  : AppImages.appSilentNormal,
              thirdImagePath: moodSatus == 'high'
                  ? AppImages.appSadColored
                  : AppImages.appSadNormal),
          SizedBox(
            height: 20,
          ),
          Text(
            'eat'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FoodStatusItem(
            label: 'the breakfast'.tr,
            firstImagePath: foodStatus == 'low'
                ? AppImages.applowFoodColored
                : AppImages.appLowFoodNormal,
            secondImagePath: foodStatus == 'medium'
                ? AppImages.appMeduimFoodColored
                : AppImages.appMeduimFoodNormal,
            thirdImagePath: foodStatus == 'high'
                ? AppImages.appHighFoodColored
                : AppImages.appHighFoodNormal,
          ),
          SizedBox(
            height: 15,
          ),
          FoodStatusItem(
            label: 'the lunch'.tr,
            firstImagePath: foodStatus == 'low'
                ? AppImages.applowFoodColored
                : AppImages.appLowFoodNormal,
            secondImagePath: foodStatus == 'medium'
                ? AppImages.appMeduimFoodColored
                : AppImages.appMeduimFoodNormal,
            thirdImagePath: foodStatus == 'high'
                ? AppImages.appHighFoodColored
                : AppImages.appHighFoodNormal,
          ),
          SizedBox(
            height: 15,
          ),
          FoodStatusItem(
            label: 'Snack'.tr,
            firstImagePath: foodStatus == 'low'
                ? AppImages.applowFoodColored
                : AppImages.appLowFoodNormal,
            secondImagePath: foodStatus == 'medium'
                ? AppImages.appMeduimFoodColored
                : AppImages.appMeduimFoodNormal,
            thirdImagePath: foodStatus == 'high'
                ? AppImages.appHighFoodColored
                : AppImages.appHighFoodNormal,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Drinks'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DrinkStatusItem(
            label: 'water'.tr,
            firstImagePath: drinkStatus == 'low'
                ? AppImages.appLowDrinkColored
                : AppImages.appLowDrinkNormal,
            secondImagePath: drinkStatus == 'high'
                ? AppImages.appHighDrinkColored
                : AppImages.appHighDrinkNormal,
          ),
          SizedBox(
            height: 15,
          ),
          DrinkStatusItem(
            label: 'the milk'.tr,
            firstImagePath: drinkStatus == 'low'
                ? AppImages.appLowDrinkColored
                : AppImages.appLowDrinkNormal,
            secondImagePath: drinkStatus == 'high'
                ? AppImages.appHighDrinkColored
                : AppImages.appHighDrinkNormal,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The sleep'.tr,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SleepStatusItem(
            label: 'nap'.tr,
            firstImagePath: sleepStatus == 'low'
                ? AppImages.appLowSleepColored
                : AppImages.appLowSleepNormal,
            secondImagePath: sleepStatus == 'high'
                ? AppImages.appHighSleepColored
                : AppImages.appHighSleepNormal,
            thirdImagePath: AppImages.appTimer,
            sleepDuration: sleepdration.toString(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The Temperature',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TempratureItem(
            firstImagePath: AppImages.appTempratre,
            label: tempratureDegree!,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MoodSatusItem extends StatelessWidget {
  String label;
  String firstImagePath;
  String secondImagePath;
  String thirdImagePath;

  MoodSatusItem({
    Key? key,
    required this.label,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: AppColors.accentColor,
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 1,
          child: Image.asset(
            firstImagePath,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Image.asset(
            secondImagePath,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Image.asset(
            thirdImagePath,
            width: 25,
            height: 25,
          ),
        ),
        Spacer(),
        Spacer(),
      ],
    );
  }
}

// ignore: must_be_immutable
class FoodStatusItem extends StatelessWidget {
  String label;
  String firstImagePath;
  String secondImagePath;
  String thirdImagePath;

  FoodStatusItem({
    Key? key,
    required this.label,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: AppColors.accentColor,
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 1,
          child: Image.asset(
            firstImagePath,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Image.asset(
            secondImagePath,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              thirdImagePath,
              width: 25,
              height: 25,
            ),
          ),
        ),
        Spacer(),
        Spacer(),
      ],
    );
  }
}

// ignore: must_be_immutable
class DrinkStatusItem extends StatelessWidget {
  String label;
  String firstImagePath;
  String secondImagePath;

  DrinkStatusItem({
    required this.label,
    required this.firstImagePath,
    required this.secondImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: AppColors.accentColor,
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 1,
          child: Image.asset(
            firstImagePath,
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Image.asset(
            secondImagePath,
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Spacer(),
        Spacer(),
      ],
    );
  }
}

// ignore: must_be_immutable
class SleepStatusItem extends StatelessWidget {
  String label;
  String firstImagePath;
  String secondImagePath;
  String thirdImagePath;
  String sleepDuration;

  SleepStatusItem({
    Key? key,
    required this.label,
    required this.sleepDuration,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: AppColors.accentColor,
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 1,
          child: Image.asset(
            firstImagePath,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Image.asset(
            secondImagePath,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Image.asset(
            thirdImagePath,
            width: 25,
            height: 25,
            color: AppColors.titleColor,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(sleepDuration, style: TextStyle(fontSize: 20)),
        Spacer(),
        Spacer(),
      ],
    );
  }
}

// ignore: must_be_immutable
class TempratureItem extends StatelessWidget {
  String firstImagePath;
  String label;
  TempratureItem({
    required this.firstImagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            firstImagePath,
            width: 30,
            height: 30,
          ),
        ),
        Spacer(),
        Spacer(),
        Spacer(),
        TempratureWidget(
          label: label,
        ),
        Spacer(),
      ],
    );
  }
}

class TempratureWidget extends StatelessWidget {
  final String label;
  TempratureWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
        color: const Color(0xfff2e6e6),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            right: 13,
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 10,
            left: 25,
            child: Container(
              width: 4,
              height: 5,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 1.0, color: const Color(0xff373333)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
