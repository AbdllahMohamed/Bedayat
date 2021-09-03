import 'package:bedayat/UI/screens/account/account.dart';
import 'package:bedayat/UI/screens/home/home.dart';
import 'package:bedayat/UI/screens/profile/profile.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 1;
  List<Widget> _screens = [
    AccountScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  late Color accountColor;
  late Color homeColor;
  late Color profileColor;

  @override
  void initState() {
    super.initState();
    selectColor();
  }

  selectColor() {
    if (_currentIndex == 0) {
      accountColor = AppColors.primaryColor;
      homeColor = AppColors.titleColor;
      profileColor = AppColors.titleColor;
    } else if (_currentIndex == 1) {
      accountColor = AppColors.titleColor;
      homeColor = AppColors.primaryColor;
      profileColor = AppColors.titleColor;
    } else {
      accountColor = AppColors.titleColor;
      homeColor = AppColors.titleColor;
      profileColor = AppColors.primaryColor;
    }
  }

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
            selectColor();
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.appAccountIcon,
                    width: 35,
                    height: 30,
                    color: accountColor,
                  ),
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SvgPicture.asset(
                  AppImages.appHomeIcon,
                  width: 35,
                  height: 35,
                  color: homeColor,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SvgPicture.asset(
                  AppImages.appProfileIcon,
                  width: 35,
                  height: 35,
                  color: profileColor,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
