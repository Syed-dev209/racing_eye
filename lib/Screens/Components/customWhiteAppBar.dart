import 'package:flutter/material.dart';

class CustomWhiteAppBar extends StatelessWidget {
  final String headerText;
  bool? showTrailing;
  CustomWhiteAppBar({required this.headerText, this.showTrailing = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('images/backWhite.png')),
        Text(
          headerText,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
        ),
        showTrailing!
            ? SizedBox(
                height: 50.0,
                width: 50.0,
                child: Row(
                  children: [
                    Expanded(child: Image.asset('images/Favorite.png')),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(child: Image.asset('images/searchBlue.png'))
                  ],
                ),
              )
            : Text('')
      ],
    );
  }
}
