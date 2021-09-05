import 'package:bedayat/app_colors/app_colors.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
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
              SizedBox(
                height: 20,
              ),
              Image.network(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
          ),
        )),
      ),
    );
  }
}
