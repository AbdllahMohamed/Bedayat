import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 20, bottom: 10),
      child: ListView(
        children: [
          Text(
            'مزاج الطفل',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MoodSatusItem(
            label: 'الصباح',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
            firstImageColor:
                moodSatus == 'low' ? AppColors.primaryColor : Color(0xffC5C3C3),
            secondImageColor: moodSatus == 'meduim'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            thirdImageColor: moodSatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 15,
          ),
          MoodSatusItem(
            label: 'الظهر',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
            firstImageColor:
                moodSatus == 'low' ? AppColors.primaryColor : Color(0xffC5C3C3),
            secondImageColor: moodSatus == 'meduim'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            thirdImageColor: moodSatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 15,
          ),
          MoodSatusItem(
            label: 'العصر',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
            firstImageColor:
                moodSatus == 'low' ? AppColors.primaryColor : Color(0xffC5C3C3),
            secondImageColor: moodSatus == 'meduim'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            thirdImageColor: moodSatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'الاكل',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FoodStatusItem(
            label: 'الافطار',
            firstImagePath: AppImages.appFullFood,
            secondImagePath: AppImages.appFullFood,
            thirdImagePath: AppImages.apphalfFood,
            firstImageColor: foodStatus == 'low'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            secondImageColor: foodStatus == 'meduim'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            thirdImageColor: foodStatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 15,
          ),
          FoodStatusItem(
            label: 'الغداء ',
            firstImagePath: AppImages.appFullFood,
            secondImagePath: AppImages.appFullFood,
            thirdImagePath: AppImages.apphalfFood,
            firstImageColor: foodStatus == 'low'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            secondImageColor: foodStatus == 'meduim'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            thirdImageColor: foodStatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 15,
          ),
          FoodStatusItem(
            label: 'وجبة خفيفة',
            firstImagePath: AppImages.appFullFood,
            secondImagePath: AppImages.appFullFood,
            thirdImagePath: AppImages.apphalfFood,
            firstImageColor: foodStatus == 'low'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            secondImageColor: foodStatus == 'meduim'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            thirdImageColor: foodStatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'المشروبات',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DrinkStatusItem(
            label: 'المياه',
            firstImagePath: AppImages.appHalfWater,
            secondImagePath: AppImages.appHalfWater,
            firstImageColor: sleepStatus == 'low'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            secondImageColor: sleepStatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 15,
          ),
          DrinkStatusItem(
            label: 'الحليب',
            firstImagePath: AppImages.appHalfWater,
            secondImagePath: AppImages.appHalfWater,
            firstImageColor: sleepStatus == 'low'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            secondImageColor: sleepStatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'النوم',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SleepStatusItem(
            label: 'القيلولة',
            firstImagePath: AppImages.appHalfSleep,
            secondImagePath: AppImages.appFullSleep,
            thirdImagePath: AppImages.appTimer,
            firstImageColor: sleepStatus == 'low'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            secondImageColor: sleepStatus == 'high'
                ? AppColors.primaryColor
                : Color(0xffC5C3C3),
            sleepDuration: sleepdration.toString(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'الحرارة',
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
  Color firstImageColor;
  Color secondImageColor;
  Color thirdImageColor;
  MoodSatusItem({
    Key? key,
    required this.label,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
    required this.firstImageColor,
    required this.secondImageColor,
    required this.thirdImageColor,
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
          child: SvgPicture.asset(
            firstImagePath,
            width: 25,
            height: 25,
            color: firstImageColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
            secondImagePath,
            width: 25,
            height: 25,
            color: secondImageColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
            thirdImagePath,
            width: 25,
            height: 25,
            color: thirdImageColor,
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
  Color firstImageColor;
  Color secondImageColor;
  Color thirdImageColor;
  FoodStatusItem({
    Key? key,
    required this.label,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
    required this.firstImageColor,
    required this.secondImageColor,
    required this.thirdImageColor,
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
          child: SvgPicture.asset(
            firstImagePath,
            width: 50,
            height: 50,
            color: firstImageColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
            secondImagePath,
            width: 50,
            height: 50,
            color: secondImageColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: SvgPicture.asset(
              thirdImagePath,
              width: 25,
              height: 25,
              color: thirdImageColor,
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
  Color firstImageColor;
  Color secondImageColor;
  DrinkStatusItem({
    required this.label,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.firstImageColor,
    required this.secondImageColor,
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
          child: SvgPicture.asset(
            firstImagePath,
            width: 30,
            height: 30,
            color: firstImageColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
            secondImagePath,
            width: 30,
            height: 30,
            color: secondImageColor,
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
  String sleepDuration;
  String firstImagePath;
  String secondImagePath;
  String thirdImagePath;
  Color firstImageColor;
  Color secondImageColor;
  SleepStatusItem({
    Key? key,
    required this.label,
    required this.sleepDuration,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
    required this.firstImageColor,
    required this.secondImageColor,
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
          child: SvgPicture.asset(
            firstImagePath,
            width: 25,
            height: 25,
            color: firstImageColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
            secondImagePath,
            width: 25,
            height: 25,
            color: secondImageColor,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
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
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SvgPicture.asset(
            firstImagePath,
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(
          width: 20,
        ),
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
