import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:intl/intl.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Screens/loginScreen.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import 'package:racing_eye/Screens/raceDetailsScreen.dart';
import '../../main.dart';

class RacesCard extends StatelessWidget {
  RaceDetailsModel dataModel;
  bool showTime = false;
  bool navigate = true;
  int index;
  RacesCard(
      {required this.dataModel, this.showTime = false, this.navigate = true,required this.index});

  @override
  Widget build(BuildContext context) {
    print(dataModel.raceDatetime!);
    var temp = DateTime.parse(dataModel.raceDatetime! + 'Z');
    print(temp);
    var dateTimeCheck =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(temp.toString(), true);
    var dateLocal = dateTimeCheck.toLocal();
    print(dateLocal);

    DateTime dateTime = DateTime.parse(dataModel.raceDatetime!);
    String date = dateLocal.day.toString();
    String month = monthList[dateTime.month - 1];
    String minute = dateLocal.minute.toString();
    String time =
        "${dateLocal.hour}:${minute.length == 2 ? minute : "0$minute"} ";
    String image = "GB-52-F";
    if (dataModel.courseImage != null) {
      image = dataModel.courseImage!;
    } else {
      image =
          "https://azbigmedia.com/wp-content/uploads/2020/08/horse-racing-tracks.png";
    }

    return GestureDetector(
      onTap: () {
        if (navigate) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => RaceDetailsScreen(
                    index: index,
                        raceId: dataModel.raceInstanceUid.toString(),
                      )));
        } else {
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Padding(
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
                          image,
                          fit: BoxFit.cover,
                          errorBuilder: (
                            e,
                            r,
                            t,
                          ) {
                            return Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataModel.raceInstanceTitle!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Course : ${dataModel.courseStyleName}",
                                      style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 13.0),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Image.network(
                                      dataModel.courseCountryCode ??
                                          "https://www.pinclipart.com/picdir/middle/448-4485361_png-file-svg-flag-icon-png-clipart.png",
                                      height: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                navigate
                                    ? AutoSizeText(
                                        "Horse : ${dataModel.horseName}",
                                        style: TextStyle(
                                            color: Color(0xff666666),
                                            fontSize: 13.0),
                                        minFontSize: 9,
                                        maxLines: 1,
                                      )
                                    : Text(''),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'images/arrowForward.png',
                              height: 35,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 105.0, left: 10.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    height: 60.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          month,
                          style: TextStyle(
                              color: myColor.shade50,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              // showTime
              //     ?
              Padding(
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30.0,
                    width: 70.0,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: new BoxDecoration(
                        //color: Colors.black45,
                        borderRadius: BorderRadius.circular(20.0)),
                  ).blurred(
                    blur: 1,
                    borderRadius: BorderRadius.circular(20.0),
                    blurColor: Colors.black,
                    colorOpacity: 0.7,
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 1.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // : Text('')
              // Container(
              //   height: 50,
              //   width: 40,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              //   ),
              //   child: Center(
              //     child: Image.network(
              //         dataModel.courseCountryCode??"https://www.pinclipart.com/picdir/middle/448-4485361_png-file-svg-flag-icon-png-clipart.png",
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
