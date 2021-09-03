import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 20),
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(AppImages.appcarouselImg1));
      },
    );
  }
}
