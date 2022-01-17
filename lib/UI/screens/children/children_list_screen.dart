import 'package:bedayat/UI/screens/children/children_list_controller.dart';
import 'package:bedayat/UI/screens/gallery/gallery_editor_screen.dart';
import 'package:bedayat/UI/screens/report/report_editor/report_editor_screen.dart';
import 'package:bedayat/models/child.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ChildrenListScreen extends StatefulWidget {
  const ChildrenListScreen({Key? key}) : super(key: key);

  @override
  _ChildrenListScreenState createState() => _ChildrenListScreenState();
}

class _ChildrenListScreenState extends State<ChildrenListScreen> {
  ChildrenController childrenController = Get.put(ChildrenController());

  @override
  Widget build(BuildContext context) {
    var headingStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(actions: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.signOutAlt, color: Colors.white),
          onPressed: () {},
        ),
      ], title: Text("children_list".tr)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() => childrenController.isLoading.value
            ? ChildrenPlaceHolder()
            : childrenController.isZeroItems.value
                ? Center(
                    child: Text("No Children".tr),
                  )
                : ListView.builder(
                    controller: childrenController.listController,
                    itemCount: childrenController.childrenList.length,
                    itemBuilder: (context, i) {
                      var child = childrenController.childrenList[i];
                      return ChildItem(
                        child: child,
                      );
                    })),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChildItem extends StatelessWidget {
  Child child;

  ChildItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            builder: (context) => Container(
                  height: 180.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                            onPressed: () => Get.to(GalleryEditor(
                                  childId: child.id ?? 0,
                                )),
                            icon: FaIcon(
                              FontAwesomeIcons.video,
                              color: Colors.red,
                            ),
                            label: Text(
                              "create_videos_photos".tr,
                              style: TextStyle(color: Colors.black),
                            )),
                        child.reports != null ? SizedBox() : Divider(),
                        child.reports != null
                            ? SizedBox()
                            : TextButton.icon(
                                onPressed: () => Get.to(ReportEditorScreen(
                                      childId: child.id ?? 0,
                                    )),
                                icon: FaIcon(
                                  FontAwesomeIcons.file,
                                  color: Colors.red,
                                ),
                                label: Text(
                                  "create_daily_report".tr,
                                  style: TextStyle(color: Colors.black),
                                )),
                      ],
                    ),
                  ),
                ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 8,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ]),
        child: ListTile(
          // trailing: Text("test"),
          leading: CachedNetworkImage(
            imageUrl: child.document,
            imageBuilder: (context, imageProvider) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${child.firstName} ${child.lastName}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "توقيت الحضور",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                child.attendance == null
                    ? "لم يحضر الطفل الي الان"
                    : DateFormat('yyyy-MM-dd – kk:mm:a')
                        .format(DateTime.parse(child.attendance!.time)),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: child.reports == null ? Colors.red : Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "report_status".tr +
                        " : " +
                        (child.reports == null
                            ? "uncompleted".tr
                            : "completed".tr),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChildrenPlaceHolder extends StatelessWidget {
  const ChildrenPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      enabled: true,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: height * 0,
                ),
                subtitle: Row(
                  children: [
                    new Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          color: Colors.grey,
                          width: width / 2,
                          height: 10,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          color: Colors.grey,
                          width: width / 2,
                          height: 10,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          color: Colors.grey,
                          width: width / 1.5,
                          height: 10,
                        ),
                        Container(
                          color: Colors.grey,
                          width: width / 1.5,
                          height: 10,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          color: Colors.grey,
                          width: width / 6,
                          height: 25,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
