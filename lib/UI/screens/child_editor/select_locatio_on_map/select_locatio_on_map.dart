import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bedayat/app_colors/app_colors.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationOnMapScreen extends StatefulWidget {
  final String routename;
  SelectLocationOnMapScreen({Key? key, required this.routename})
      : super(key: key);
  @override
  _SelectLocationOnMapScreenState createState() =>
      _SelectLocationOnMapScreenState();
}

class _SelectLocationOnMapScreenState extends State<SelectLocationOnMapScreen> {
  // late List<Marker> myMarker;
  // late LatLng selectedPoint;
  // @override
  // void initState() {
  //   super.initState();
  //   selectedPoint = LatLng(
  //       childEditorController.latitude!, childEditorController.longitude!);
  //   myMarker = [
  //     Marker(
  //       markerId: MarkerId('m1'),
  //       infoWindow: InfoWindow(title: 'الموقع'),
  //       position: LatLng(
  //           childEditorController.latitude!, childEditorController.longitude!),
  //     ),
  //   ];
  // }

  // _handelTap(tappedPoint) {
  //   setState(
  //     () {
  //       myMarker = [];

  //       myMarker.add(Marker(
  //         markerId: MarkerId(
  //           tappedPoint.toString(),
  //         ),
  //         position: tappedPoint,
  //       ));

  //       selectedPoint = tappedPoint;
  //       print(selectedPoint);
  //     },
  //   );
  // }

  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    print(locale);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Select your location'.tr,
        ),
        centerTitle: true,
      ),
      // body: GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(childEditorController.latitude!,
      //         childEditorController.longitude!),
      //     zoom: 10,
      //   ),
      //   onTap: _handelTap,
      //   markers: Set.from(myMarker),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          childEditorController.step += 1;
        },
        child: Icon(
          locale == Locale('en')
              ? Icons.arrow_forward_ios_outlined
              : Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
