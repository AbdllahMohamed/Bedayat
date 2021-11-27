import 'package:bedayat/UI/screens/app_drawer/app_drawer.dart';
import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:bedayat/UI/screens/edit_account_information/edit_account_information_screen.dart';
import 'package:bedayat/UI/screens/events/events.dart';
import 'package:bedayat/UI/screens/terms_and_condtion/terms_and_condtions.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
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
              childEditorController.step.value = 1;
              Get.to(ChildEditorScreen(
                routename: 'addChild',
              ));
            },
          ),
          DrawerItem(
            label: 'Edit Account Information'.tr,
            imagePath: AppImages.appEditIcon,
            onTap: () {
              Get.to(EditAccountInformationScreen());
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
          // DrawerItem(
          //   label: 'logout'.tr,
          //   imagePath: AppImages.applogout,
          //   onTap: () {
          //     authController.logut();
          //   },
          // )
        ],
      ),
    );
  }
}
