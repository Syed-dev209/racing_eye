import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {
  String imagePath;
  ImagePlaceHolder({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      width: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
              image: AssetImage(imagePath)
          )
      ),
    );
  }
}
