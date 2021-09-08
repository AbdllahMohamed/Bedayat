import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GalleryWidget extends StatefulWidget {
  GalleryController galleryController = Get.put(GalleryController());
  int childId;
  GalleryWidget({required this.childId, required this.galleryController});

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  void initState() {
    super.initState();
    widget.galleryController.fetchGallery(widget.childId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.galleryController.loadingProcess.value
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
        : widget.galleryController.galleryList.length == 0
            ? Center(
                child: Text(
                  'لاتوجد بيانات',
                  style: TextStyle(fontSize: 22, color: AppColors.accentColor),
                ),
              )
            : GridView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: widget.galleryController.galleryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  print(
                      "$imagesBaseUrl${widget.galleryController.galleryList[index].img!.replaceAll('public', 'storage')}");
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                          "$imagesBaseUrl${widget.galleryController.galleryList[index].img!.replaceAll('public', 'storage')}"));
                },
              ));
  }
}
