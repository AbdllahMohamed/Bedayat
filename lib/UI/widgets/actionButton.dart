import 'package:bedayat/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  String? label;
  VoidCallback? onPressed;
  ActionButton({this.label, this.onPressed});
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
<<<<<<< HEAD
=======
          elevation: 0,
>>>>>>> e42aafec72c24a98ec52d54662673ac4f747c558
          primary: AppColors.primaryColor,
          minimumSize: Size(
            deviceWidth * 0.9,
            55,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),
        ),
        child: Text(
          label!,
          style: TextStyle(
<<<<<<< HEAD
            fontSize: 17,
=======
            fontSize: 15,
>>>>>>> e42aafec72c24a98ec52d54662673ac4f747c558
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
