import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagePlaceHolder extends StatelessWidget {
  String imagePath;

  ImagePlaceHolder({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64.0,
        width: 60.0,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SvgPicture.network(
          imagePath,
          placeholderBuilder: (context) {
            return Image.asset("images/defaultShirt.PNG");
          },
        )
        // FadeInImage(
        //   image: NetworkImage(imagePath,),
        //   placeholder: AssetImage("images/pic.PNG"),
        // ),
        );
  }
}
