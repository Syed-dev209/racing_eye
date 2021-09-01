import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import '../../main.dart';

class RacesCard extends StatelessWidget {
  RaceDetailsModel dataModel;
  bool showTime = false;
  RacesCard({required this.dataModel, this.showTime = false});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(dataModel.raceDatetime!);
    String date = dateTime.day.toString();
    String month = monthList[dateTime.month - 1];
    String time = "${dateTime.hour}:${dateTime.minute}";
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 247.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: [
            Container(
              height: 247.0,
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
                      child: Image.network(
                        "https://www.rp-assets.com/course-photos/GB-52-f.jpg",
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataModel.raceInstanceTitle!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Sponsored by :- ${dataModel.courseStyleName}",
                                style: TextStyle(
                                    color: Color(0xff666666), fontSize: 13.0),
                              )
                            ],
                          ),
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
                        date,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        month,
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
            showTime
                ? Padding(
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
                              time,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 1.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Text('')
          ],
        ),
      ),
    );
  }
}
