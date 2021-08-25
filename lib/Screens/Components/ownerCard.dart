import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';

class OwnerCard extends StatelessWidget {
  String ownerName, flagUrl, ownerImage;
  bool? bgColorWhite;
  OwnerCard(
      {required this.ownerName,
      required this.flagUrl,
      required this.ownerImage,
      this.bgColorWhite = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 25.0, right: 10.0, top: 15.0, bottom: 15.0),
      height: 90.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: bgColorWhite! ? Colors.white : Color(0xff02468D),
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ImagePlaceHolder(
          imagePath: ownerImage,
        ),
        SizedBox(
          width: 4.0,
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 1.0,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  ownerName,
                  style: TextStyle(
                      color: bgColorWhite! ? Colors.black : Colors.white,
                      fontSize: 18.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/cup.png',
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'AED 0.00',
                    style: TextStyle(
                        color:
                            bgColorWhite! ? Colors.black26 : Color(0xff6790BB),
                        fontSize: 15.0),
                  )
                ],
              ),
              SizedBox(
                height: 1.0,
              )
            ],
          ),
        ),
        // SizedBox(
        //   width: 53.0,
        // ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 17.0,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(flagUrl),
            ),
          ),
        )
      ]),
    );
  }
}
