import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'gallery_editor_controller.dart';

class GalleryEditor extends StatefulWidget {
  final int childId;
  const GalleryEditor({Key? key, required this.childId}) : super(key: key);

  @override
  _GalleryEditorState createState() => _GalleryEditorState();
}

class _GalleryEditorState extends State<GalleryEditor> {
  late GalleryEditorController galleriesEditorController;

  // @override
  void initState() {
    super.initState();
    galleriesEditorController =
        Get.put(GalleryEditorController(childId: widget.childId));
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<GalleryEditorController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Gallery"),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () => galleriesEditorController.save(),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () => galleriesEditorController.pickupFiles(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.image,
                        size: 70,
                        color: galleriesEditorController.attachments.length > 0
                            ? Colors.red
                            : Colors.grey,
                      ),
                      galleriesEditorController.attachments.length == 0
                          ? Text("select_the_content".tr)
                          : SizedBox(),
                      SizedBox(
                        height: 2,
                      ),
                      galleriesEditorController.attachments.length > 0
                          ? TextButton.icon(
                              onPressed: () => galleriesEditorController
                                  .deleteFiles(galleriesEditorController
                                      .attachments.first),
                              icon: FaIcon(
                                FontAwesomeIcons.trash,
                                size: 19,
                              ),
                              label: Text("delete".tr))
                          : SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
