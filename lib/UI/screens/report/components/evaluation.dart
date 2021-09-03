import 'package:bedayat/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class EvaluationWidget extends StatelessWidget {
  const EvaluationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _devceWidth = MediaQuery.of(context).size.width;
    var _devceHeight = MediaQuery.of(context).size.height;
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
          PositiveEvaluation(
            label: 'يتعرف علي الحرف الجديد',
          ),
          SizedBox(
            height: 15,
          ),
          NegativeEvaluation(
            label: 'يميز شكل الحرف',
          ),
          SizedBox(
            height: 15,
          ),
          NegativeEvaluation(
            label: 'يميز صوت الحرف',
          ),
          SizedBox(
            height: 15,
          ),
          PositiveEvaluation(
            label: 'متمكن من كتابة الحرف',
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
          PositiveEvaluation(
            label: 'يستمتع و يندمج بالاركان',
          ),
          SizedBox(
            height: 15,
          ),
          PositiveEvaluation(
            label: 'يتقن النشاط ( المنتسوري ) ',
          ),
          SizedBox(
            height: 15,
          ),
          PositiveEvaluation(
            label: 'يعيد الالعاب والادوات بعد الانتهاء منها',
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
          PositiveEvaluation(
            label: 'يندمج في الركن الفني ',
          ),
          SizedBox(
            height: 15,
          ),
          PositiveEvaluation(
            label: 'يعتمد علي نفسه في الركن الفني',
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
          PositiveEvaluation(
            label: 'يستمتع بسماع القصة',
          ),
        ],
      ),
    );
  }
}

class NegativeEvaluation extends StatelessWidget {
  final String label;
  NegativeEvaluation({
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

class PositiveEvaluation extends StatelessWidget {
  final String label;
  PositiveEvaluation({
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
