import 'package:bedayat/UI/screens/add_child/add_child_step_two.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddChildMapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  AddChildMapScreen({
    required this.latitude,
    required this.longitude,
  });

  @override
  _AddChildMapScreenState createState() => _AddChildMapScreenState();
}

class _AddChildMapScreenState extends State<AddChildMapScreen> {
  late List<Marker> myMarker;
  late LatLng selectedPoint;
  @override
  void initState() {
    super.initState();
    selectedPoint = LatLng(
      widget.latitude,
      widget.longitude,
    );
    myMarker = [
      Marker(
        markerId: MarkerId('m1'),
        infoWindow: InfoWindow(title: 'الموقع'),
        position: LatLng(
          widget.latitude,
          widget.longitude,
        ),
      ),
    ];
  }

  _handelTap(tappedPoint) {
    setState(
      () {
        myMarker = [];

        myMarker.add(Marker(
          markerId: MarkerId(
            tappedPoint.toString(),
          ),
          position: tappedPoint,
        ));

        selectedPoint = tappedPoint;
        print(selectedPoint);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Select your location'.tr,
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.latitude,
            widget.longitude,
          ),
          zoom: 10,
        ),
        onTap: _handelTap,
        markers: Set.from(myMarker),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          Get.to(
            AddChildStepTwoScreen(
                // location: selectedPoint.latitude.toString(),
                // longitude: selectedPoint.longitude,

                ),
          );
        },
        child: Icon(
          Icons.forward_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
