import 'package:bedayat/UI/screens/register/register_step_three.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegisterMapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  RegisterMapScreen({
    required this.latitude,
    required this.longitude,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  _RegisterMapScreenState createState() => _RegisterMapScreenState();
}

class _RegisterMapScreenState extends State<RegisterMapScreen> {
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
          'من فضلك قم بتحديد موقعك',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          print(selectedPoint.latitude);
          print(selectedPoint.longitude);
          Get.to(
            RegisterStepThreeScreen(
              // location: selectedPoint.latitude.toString(),
              // longitude: selectedPoint.longitude,
              nameController: widget.nameController,
              phoneController: widget.phoneController,
              emailController: widget.emailController,
              passwordController: widget.passwordController,
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
