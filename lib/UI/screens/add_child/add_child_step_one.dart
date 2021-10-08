import 'dart:async';
import 'dart:io';
import 'package:bedayat/UI/screens/map/add_child_map.dart';
import 'package:flutter/material.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddChildStepOneScreen extends StatefulWidget {
  @override
  _AddChildStepOneScreenState createState() => _AddChildStepOneScreenState();
}

class _AddChildStepOneScreenState extends State<AddChildStepOneScreen> {
  addChildStepOne() async {
    if (Platform.isAndroid) {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();

      Get.to(
        AddChildMapScreen(
            latitude: _locationData.latitude!,
            longitude: _locationData.longitude!),
      );
    } else {
      Get.to(
        AddChildMapScreen(
          latitude: 23.8859,
          longitude: 45.0792,
        ),
      );
    }
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.8859, 45.0792),
    zoom: 9,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Child'.tr,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 6,
                          color: AppColors.accentColor,
                        ),
                      ),
                      child: Text(
                        '1/5',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Choose your business location or your residence location'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ActionButton(
                    label: 'Select your location'.tr,
                    onPressed: () async {
                      addChildStepOne();
                    }),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
