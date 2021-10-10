import 'package:bedayat/UI/screens/add_child/add_child_step_one.dart';
import 'package:bedayat/UI/screens/events/events.dart';
import 'package:bedayat/UI/screens/terms_and_condtion/terms_and_condtions.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Main Menu'.tr,
                style: TextStyle(fontSize: 23),
              ),
            ),
            DrawerItem(
              label: 'Add Child'.tr,
              imagePath: AppImages.appChildIcon,
              onTap: () {
                Get.to(AddChildStepOneScreen());
              },
            ),
            DrawerItem(
              label: 'Coming Events'.tr,
              imagePath: AppImages.appEvents,
              onTap: () {
                Get.to(EventsScreen());
              },
            ),
            DrawerItem(
              label: 'Change Language'.tr,
              imagePath: AppImages.applanguageIcon,
              onTap: () {
                final locale = Get.locale;
                final box = GetStorage();
                if (locale == Locale('en')) {
                  Get.updateLocale(Locale('ar'));
                  box.write('languageCode', 'ar');
                } else {
                  Get.updateLocale(Locale('en'));
                  box.write('languageCode', 'en');
                }
              },
            ),
            DrawerItem(
              label: 'Terms and Condtions'.tr,
              imagePath: AppImages.appTermsAndConditions,
              onTap: () {
                Get.to(TermsAndConditionsScreen());
              },
            ),
            DrawerItem(
              label: 'logout'.tr,
              imagePath: AppImages.applogout,
              onTap: () {
                authController.logut();
              },
            )
          ],
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
        padding:
            const EdgeInsets.only(left: 10, right: 12.0, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
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
