import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomWhiteAppBar extends StatelessWidget {
  final String headerText;
  bool? showTrailing;

  CustomWhiteAppBar({required this.headerText, this.showTrailing = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
          onTap: () async {
            bool check = await Navigator.maybePop(context);
            print(check);
            // Navigator.of(context, rootNavigator: true).pop();
          },
          child: SvgPicture.asset('images/SVGS/backButton.svg')),
      title: Text(
        headerText,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 20.0, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      actions: showTrailing!
          ? [
              Image.asset(
                'images/Favorite.png',
                cacheHeight: 20,
                cacheWidth: 20,
              ),
              SvgPicture.asset('images/SVGS/searchIcon.svg')
            ]
          : [],
    );
  }
}
