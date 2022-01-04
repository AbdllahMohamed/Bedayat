import 'package:bedayat/UI/screens/teacher/teacher_controller.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/models/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utilities.dart';
import 'package:intl/intl.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  TeacherControllerM teacherController = Get.put(TeacherControllerM());
  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Image.asset(
                    AppImages.appSubLogo,
                  ),
                ],
              ),
            ),

            // Teacher Header
            teacherController.isTeacherDataLoading.value
                ? TeacherPlaceHolder()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(teacherController
                                              .teacher.value!.profileImg ==
                                          null
                                      ? fullImageUrl(
                                          shortUrl: teacherController
                                              .teacher.value!.profileImg)
                                      : "https://www.itdp.org/wp-content/uploads/2021/06/avatar-man-icon-profile-placeholder-260nw-1229859850-e1623694994111.jpg"),
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(width: 25),
                                Text(
                                  locale == Locale('en')
                                      ? teacherController
                                          .teacher.value!.englishName
                                          .toString()
                                      : teacherController
                                          .teacher.value!.arabicName
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.titleColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              locale == Locale('en')
                                  ? teacherController
                                      .teacher.value!.englishDescription
                                      .toString()
                                  : teacherController
                                      .teacher.value!.arabicDescription
                                      .toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

            // Rating button
            teacherController.isUserAbleToRate.value
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 15.0, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: teacherController.showRateForm,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 30, right: 0, top: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'Rate'.tr,
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

            // list of ratings

            SizedBox(
              height: 10,
            ),

            Divider(),
            // RateItem(),

            teacherController.isLoading.value
                ? const Expanded(
                    child: RatingsPlaceHolder(),
                  )
                : teacherController.isZeroItems.value
                    ? const Center(
                        child: Text("No ratings"),
                      )
                    : Expanded(
                        child: ListView.builder(
                            controller: teacherController.listController,
                            itemCount: teacherController.ratingsList.length,
                            itemBuilder: (context, i) {
                              var rate = teacherController.ratingsList[i];
                              // DateTime p = DateTime.parse(notification.createdAt);
                              return RateItem(
                                rating: rate,
                                // offer: offer,
                              );
                            }),
                      ),
          ],
        ),
      )),
    );
  }
}

class RateItem extends StatelessWidget {
  Rating rating;

  RateItem({Key? key, required Rating this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBarIndicator(
              rating: double.parse(rating.rate),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 30.0,
              direction: Axis.horizontal,
            ),
            SizedBox(
              height: 10,
            ),
            Text(rating.comment),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(rating.user.name),
            Text(DateFormat('yyyy-MM-dd  kk:mm a')
                .format(DateTime.parse(rating.createdAt))),
          ],
        ),
      ),
    );
  }
}

class RatingsPlaceHolder extends StatelessWidget {
  const RatingsPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      enabled: true,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: height * 0.05,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 6,
                      height: 25,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 6,
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class TeacherPlaceHolder extends StatelessWidget {
  const TeacherPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.grey.withOpacity(0.2),
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Container(
              color: Colors.grey,
              width: double.infinity,
              height: height * 0.05,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Container(
                  color: Colors.grey,
                  width: width / 1.5,
                  height: 10,
                ),
                Container(
                  color: Colors.grey,
                  width: width / 1.5,
                  height: 10,
                ),
                Container(
                  color: Colors.grey,
                  width: width / 1.5,
                  height: 60,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey,
                  width: width / 6,
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }
}
