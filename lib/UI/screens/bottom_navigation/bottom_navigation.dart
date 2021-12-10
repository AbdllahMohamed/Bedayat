import 'package:bedayat/UI/screens/home/home.dart';
import 'package:bedayat/UI/screens/offers/offers_screen.dart';
import 'package:bedayat/UI/screens/profile/profile.dart';
import 'package:bedayat/UI/screens/settings/settings.dart';
import 'package:bedayat/UI/screens/store/store.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('test2');
      }
    });
  }

  int _currentIndex = 0;
  List<Widget> _screens = [
    // AccountScreen(),
    HomeScreen(),
    Store(),
    OffersScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        iconSize: 30,
        elevation: 5,
        selectedItemColor: Colors.red,
        unselectedItemColor: AppColors.titleColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SvgPicture.asset(
                  AppImages.appHomeIcon,
                  width: 35,
                  height: 35,
                  color: _currentIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.accentColor,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FaIcon(
                  FontAwesomeIcons.store,
                  color: _currentIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.accentColor,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FaIcon(
                  FontAwesomeIcons.percent,
                  color: _currentIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.accentColor,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FaIcon(
                  FontAwesomeIcons.cog,
                  color: _currentIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.accentColor,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
