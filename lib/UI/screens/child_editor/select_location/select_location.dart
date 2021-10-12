import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLocationScreen extends StatefulWidget {
  final String routename;
  SelectLocationScreen({Key? key, required this.routename}) : super(key: key);
  @override
  _SelectLocationScreenState createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  registerStepTwo() async {
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
      if (widget.routename == 'addChild') {
        print('fre');
        childEditorController.fetchchildern();
      }

      _locationData = await location.getLocation();
      childEditorController.step += 1;

      childEditorController.latitude = _locationData.latitude;
      childEditorController.longitude = _locationData.longitude;

      // Get.to(
      //   SelectLocationOnMapScreen(
      //     latitude: _locationData.latitude!,
      //     longitude: _locationData.longitude!,
      //     nameController: widget.nameController,
      //     phoneController: widget.phoneController,
      //     emailController: widget.emailController,
      //     passwordController: widget.passwordController,
      //   ),
      // );
    } else {
      // Get.to(
      // SelectLocationOnMapScreen(
      //   latitude: 23.8859,
      //   longitude: 45.0792,
      //   nameController: widget.nameController,
      //   phoneController: widget.phoneController,
      //   emailController: widget.emailController,
      //   passwordController: widget.passwordController,
      // ),
      // );
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
                        childEditorController.step -= 1;
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
                    if (widget.routename == 'register')
                      Text(
                        'Register'.tr,
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
                        '2/6',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                if (widget.routename == 'addChild')
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
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                      registerStepTwo();
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
