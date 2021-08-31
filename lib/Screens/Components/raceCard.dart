import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import '../../main.dart';

class RacesCard extends StatelessWidget {
  const RacesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 240.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: [
            Container(
              height: 240.0,
              width: double.maxFinite,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: [
                  SizedBox(
                    height: 150.0,
                    width: double.maxFinite,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      child: Image.asset(
                        "images/noRaces.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sharjah',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Sponsored by :- N/A",
                              style: TextStyle(
                                  color: Color(0xff666666), fontSize: 13.0),
                            )
                          ],
                        ),
                        Image.asset('images/arrowDown.png')
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 105.0, left: 10.0),
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  height: 65.0,
                  width: 55.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        '29',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Oct',
                        style: TextStyle(
                            color: myColor.shade50,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                    ],
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, top: 10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30.0,
                  width: 70.0,
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: new BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20.0)),
                ).blurred(
                  blur: 15,
                  borderRadius: BorderRadius.circular(20.0),
                  overlay: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 1.0,
                      ),
                      Icon(
                        Icons.access_time_outlined,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      Text(
                        '19:00',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 1.0,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
