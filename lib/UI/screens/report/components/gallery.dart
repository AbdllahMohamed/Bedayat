import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GalleryWidget extends StatefulWidget {
  int childId;
  GalleryWidget({required this.childId});

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final GalleryController galleryController = Get.put(GalleryController());

  @override
  void initState() {
    super.initState();
    print("widget.childId");
    print(widget.childId);
    galleryController.fetchGallery(widget.childId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => galleryController.loadingProcess.value
          ? Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                width: 200,
                height: 240,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.accentColor,
                    ),
                  ),
                ),
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.only(top: 20),
              itemCount: galleryController.galleryList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                print(
                    "$baseUrl${galleryController.galleryList[index].img!.replaceAll('public', 'storage')}");
                return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        "$baseUrl${galleryController.galleryList[index].img!.replaceAll('public', 'storage')}"));
              },
            ),
    );
  }
}
