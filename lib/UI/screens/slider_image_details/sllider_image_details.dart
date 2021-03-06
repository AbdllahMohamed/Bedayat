import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderImageDetails extends StatefulWidget {
  String imagePath;
  String title;
  String description;
  SliderImageDetails({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  _SliderImageDetailsState createState() => _SliderImageDetailsState();
}

class _SliderImageDetailsState extends State<SliderImageDetails> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _devicHeight = MediaQuery.of(context).size.height;
    print(widget.imagePath);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 28.0,
                right: 15,
                left: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.appLogo,
                    width: 106,
                    height: 56,
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  width: _deviceWidth,
                  height: _devicHeight / 2,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: AppColors.titleColor,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.description,
                style: TextStyle(
                  color: AppColors.titleColor,
                  fontSize: 20,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
