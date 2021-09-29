import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String imagePath;
  CircleImageWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage(imagePath),
      radius: 40,
    );
  }
}
