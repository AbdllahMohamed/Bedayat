import 'package:bedayat/UI/screens/report/components/activity.dart';
import 'package:bedayat/UI/screens/report/components/evaluation.dart';
import 'package:bedayat/UI/screens/report/components/gallery.dart';
import 'package:bedayat/UI/screens/report/components/general.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/controllers/event_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:get/get.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final EventController eventController = Get.put(EventController());
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        eventController.eventsList.clear();
        eventController.fetchEvents(selectedDate.toString().substring(0, 10));
      });
  }

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Image.asset(
                    AppImages.appSubLogo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 25),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.appCalender,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(width: 25),
                      Text(
                        'الفعاليات القادمة',
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ActionButton(
                  label: 'اختيار التاريخ',
                  onPressed: () => _selectDate(context),
                ),
                SizedBox(
                  height: 40,
                ),
                Obx(() {
                  print(eventController.eventsList.length);
                  return eventController.loadingProcess.value
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.accentColor,
                            ),
                          ),
                        )
                      : eventController.eventsList.length == 0
                          ? Center(
                              child: Text(
                                'لاتوجد فعاليات',
                                style: TextStyle(
                                    fontSize: 22, color: AppColors.accentColor),
                              ),
                            )
                          : ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: eventController.eventsList.length,
                              itemBuilder: (_, i) => Column(
                                children: [
                                  Container(
                                    width: _deviceWidth,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            margin: EdgeInsets.only(right: 20),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff7F2BEE),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              eventController
                                                  .eventsList[i].title!,
                                              style: TextStyle(
                                                fontSize: 8,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppImages.appCalender,
                                                    width: 15,
                                                    height: 15,
                                                    color:
                                                        AppColors.accentColor,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    eventController
                                                        .eventsList[i].time!
                                                        .substring(0, 10),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: _deviceWidth / 6,
                                                  ),
                                                  SvgPicture.asset(
                                                    AppImages.appTimer,
                                                    width: 15,
                                                    height: 15,
                                                    color:
                                                        AppColors.accentColor,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    '${eventController.eventsList[i].time!.substring(11, 15)} صباحا',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'يرجي احضار طبق علي اختيارك',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff7A7171),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xffF9F4F4),
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
