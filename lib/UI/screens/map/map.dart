// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   final double latitude;
//   final double longitude;

//   final bool isSelecting;

//   MapScreen({
//     required this.latitude,
//     required this.longitude,
//     required this.isSelecting,
//   });

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late LatLng _pickedLocation;

//   void _selectLocation(LatLng position) {
//     setState(() {
//       _pickedLocation = position;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).hoverColor,
//         title: Text(
//           'من فضلك قم بتحديد المكان',
//         ),
//         centerTitle: true,
//         actions: <Widget>[
//           if (widget.isSelecting)
//             IconButton(
//               icon: Icon(
//                 Icons.check,
//                 color: _pickedLocation != null
//                     ? Theme.of(context).accentColor
//                     : Theme.of(context).hoverColor,
//               ),
//               onPressed: _pickedLocation == null
//                   ? null
//                   : () {
//                       Navigator.of(context).pop(_pickedLocation);
//                     },
//             ),
//         ],
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(
//             widget.latitude,
//             widget.longitude,
//           ),
//           zoom: 16,
//         ),
//         onTap: widget.isSelecting ? _selectLocation : null,
//         // markers: Marker(
//         //           markerId: MarkerId('m1'),
//         //           position: _pickedLocation ??
//         //               LatLng(
//         //                 widget.latitude,
//         //                 widget.longitude,
//         //               ),
//         //         ),
//       ),
//     );
//   }
// }
