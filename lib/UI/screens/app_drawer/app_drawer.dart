import 'package:bedayat/UI/screens/events/events.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'القائمة الرئيسية',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              DrawerItem(
                label: 'الاحداث القادمة',
                imagePath: AppImages.appEvents,
                onTap: () {
                  Get.to(EventsScreen());
                },
              ),
              DrawerItem(
                label: 'تسجيل الخروج',
                imagePath: AppImages.applogout,
                onTap: () {
                  authController.logut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String? label;
  final String? imagePath;
  final VoidCallback? onTap;
  DrawerItem({
    this.label,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    imagePath!,
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
            Container(
              width: deviceWidth,
              child: Divider(
                color: Color(0xffF6F5F5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
