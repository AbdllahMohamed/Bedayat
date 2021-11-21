import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
  final String imageContent;
  ImageSliderWidget(
      {required this.imagePath,
      required this.imageContent,
      required this.imageTitle});

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0x670c0c0c),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: 60,
            right: 30,
            left: 30,
            child: Container(
              width: 300,
              child: Text(
                imageTitle,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: 30,
            left: 30,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: kIsWeb ? _deviceWidth / 2.5 : 300,
              child: Text(
                imageContent,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
