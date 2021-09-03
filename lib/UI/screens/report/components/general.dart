import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({Key? key}) : super(key: key);

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
          ActivityItem(
            label: 'الصباح',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityItem(
            label: 'الظهر',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityItem(
            label: 'العصر',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
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
          ActivityItem(
            label: 'الافطار',
            firstImagePath: AppImages.appFullFood,
            secondImagePath: AppImages.appFullFood,
            thirdImagePath: AppImages.apphalfFood,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityItem(
            label: 'الغداء  ',
            firstImagePath: AppImages.appFullFood,
            secondImagePath: AppImages.appFullFood,
            thirdImagePath: AppImages.apphalfFood,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'وجبة خفيفة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.accentColor,
                ),
              ),
              Spacer(),
              SizedBox(
                width: 12,
              ),
              SvgPicture.asset(
                AppImages.appFullFood,
                width: 30,
                height: 50,
              ),
              SizedBox(
                width: 15,
              ),
              SvgPicture.asset(
                AppImages.appFullFood,
                width: 30,
                height: 50,
              ),
              SizedBox(
                width: 15,
              ),
              SvgPicture.asset(
                AppImages.apphalfFood,
                width: 30,
                height: 30,
              ),
              Spacer(),
            ],
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
          ActivityItem(
            label: '  المياه',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityItem(
            label: 'الحليب',
            firstImagePath: AppImages.appHappy,
            secondImagePath: AppImages.appSilent,
            thirdImagePath: AppImages.appSad,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ActivityItem extends StatelessWidget {
  String label;
  String firstImagePath;
  String secondImagePath;
  String thirdImagePath;
  ActivityItem({
    required this.label,
    required this.firstImagePath,
    required this.secondImagePath,
    required this.thirdImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            color: AppColors.accentColor,
          ),
        ),
        Spacer(),
        Spacer(),
        SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          firstImagePath,
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 15,
        ),
        SvgPicture.asset(
          secondImagePath,
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 15,
        ),
        SvgPicture.asset(
          thirdImagePath,
          width: 30,
          height: 30,
        ),
        Spacer(),
      ],
    );
  }
}
