import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String imagePath;
  CircleImageWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(imagePath),
        backgroundColor: Colors.grey[200],
      ),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Colors.red,
          width: 5.0,
        ),
      ),
    );
  }
}
