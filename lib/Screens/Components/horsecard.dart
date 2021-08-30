import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';

class HorseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 100.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ImagePlaceHolder(
            imagePath:
                "https://www.publicdomainpictures.net/pictures/350000/velka/uae-flag.jpg",
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
                Text(
                  '4 years old, CH C',
                  style: TextStyle(color: Color(0xff1b5898)),
                ),
                Text(
                  "Name of horse",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/Stable.png',
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Al Ajban stables',
                      style: TextStyle(color: Colors.black26, fontSize: 16.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.0,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 4.0, top: 4.0),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://www.publicdomainpictures.net/pictures/350000/velka/uae-flag.jpg"),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
