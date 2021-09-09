import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                kIsWeb
                    ? Positioned(
                        top: -200,
                        left: -240,
                        bottom: -200,
                        child: Image.asset(
                          AppImages.appCurve,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Positioned(
                        top: -200,
                        left: -85,
                        bottom: -200,
                        child: SvgPicture.asset(
                          AppImages.appCurveSvg,
                          color: AppColors.primaryColor,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                Padding(
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
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 20,
                  child: Text(
                    'الإشعارات',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.titleColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 150.0,
                    left: 5,
                    bottom: 25,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29a7a6a6),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // circularImageWithBorder(
                            //   imgPath: AppImages.appchild,
                            // ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'حفل خلال يوم السبت المقبل',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.titleColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('رنا مجدى',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.accentColor))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget circularImageWithBorder({String? imgPath}) {
  return CircleAvatar(
    backgroundColor: Colors.transparent,
    backgroundImage: AssetImage(imgPath!),
    radius: 40,
  );
}
