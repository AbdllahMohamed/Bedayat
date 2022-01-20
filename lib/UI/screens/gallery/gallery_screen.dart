import 'package:bedayat/UI/screens/gallery/gallery_controller.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/models/gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:intl/intl.dart';

class GalleryScreen extends StatefulWidget {
  int childId;

  GalleryScreen({Key? key, required this.childId}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late GalleryController galleryController;

  @override
  void initState() {
    galleryController = Get.put(GalleryController(childId: widget.childId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.back();
                },
              ),
              Image.asset(
                AppImages.appSubLogo,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, right: 25, left: 25),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.images,
                color: Colors.red,
              ),
              SizedBox(width: 15),
              Text(
                'gallery'.tr,
                style: TextStyle(
                  fontSize: 23,
                  color: AppColors.titleColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: Obx(() => galleryController.isLoading.value
              ? const OffersPlaceHolder()
              : galleryController.isZeroItems.value
                  ? const Center(
                      child: Text("No Images"),
                    )
                  : ListView.builder(
                      controller: galleryController.listController,
                      itemCount: galleryController.galleryList.length,
                      itemBuilder: (context, i) {
                        var media = galleryController.galleryList[i];
                        return MediaItem(
                          media: media,
                        );
                      })),
        )
      ],
    )));
  }
}

class MediaItem extends StatelessWidget {
  Media media;
  MediaItem({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: media.img,
              placeholder: (context, url) => CircularProgressIndicator(
                strokeWidth: 2,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Text(
                "${DateFormat('yyyy-MM-dd  kk:mm a').format(DateTime.parse(media.createdAt))}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async => await launch(media.img),
                      icon: FaIcon(
                        FontAwesomeIcons.download,
                        color: Colors.white,
                      ),
                      label: Text(
                        "download".tr,
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OffersPlaceHolder extends StatelessWidget {
  const OffersPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      enabled: true,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: height * 0.23,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 4,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
