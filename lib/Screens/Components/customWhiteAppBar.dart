import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomWhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String headerText;
  bool? showTrailing;

  CustomWhiteAppBar({required this.headerText, this.showTrailing = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Navigator.canPop(context)
          ? GestureDetector(
              onTap: () async {
                 await Navigator.maybePop(context);

                // Navigator.of(context, rootNavigator: true).pop();
              },
              child: SvgPicture.asset('images/SVGS/backButton.svg'))
          : null,
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
              SvgPicture.asset('images/SVGS/searchIcon.svg'),
              const SizedBox(
                width: 12,
              )
            ]
          : [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
