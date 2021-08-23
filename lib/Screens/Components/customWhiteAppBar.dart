import 'package:flutter/material.dart';

class CustomWhiteAppBar extends StatelessWidget {
  final String headerText;
  CustomWhiteAppBar({required this.headerText});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('images/backWhite.png'),
        Text(headerText,style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0
        ),),
        SizedBox(
          height: 50.0,
          width: 50.0,
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                  child: Image.asset('images/Favorite.png'))),
              SizedBox(width: 8.0,),
              Expanded(child: Image.asset('images/searchBlue.png'))
            ],
          ),)
      ],
    );
  }
}
