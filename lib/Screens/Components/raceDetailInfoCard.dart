import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerTables.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';

import '../../main.dart';

class RaceDetailsInfoCard extends StatefulWidget {
  RaceResultsModel data;
  RaceDetailsInfoCard({required this.data});

  @override
  _RaceDetailsInfoCardState createState() => _RaceDetailsInfoCardState();
}

class _RaceDetailsInfoCardState extends State<RaceDetailsInfoCard> {
  DateTime? dateTime;
  bool emptyList = false;
  bool noData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime = DateTime.parse(widget.data.data!.raceCard!.raceDatetime!);
    if (widget.data.data!.raceCard!.prizes!.isEmpty) {
      setState(() {
        emptyList = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data.data!.raceCard!.prizes!);

    return Container(
      height: 200.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: myColor.shade50, borderRadius: BorderRadius.circular(18.0)),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AutoSizeText(
                    widget.data.data!.raceCard!.raceInstanceTitle!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    maxLines: 2,
                    minFontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "images/timeCircle.png",
                        height: 15,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "${dateTime!.hour}:${dateTime!.minute}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: 10.0,
          // ),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Image.asset("images/calenderWhite.png"),
                    SizedBox(width: 5),
                    Text(
                      "${dateTime!.day} ${monthList[dateTime!.month - 1]}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9AB5D1)),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                "Course: ${widget.data.data!.raceCard!.courseStyleName}",
                style: TextStyle(color: Color(0xff9AB5D1)),
              )
            ],
          ),
          // SizedBox(
          //   height: 10.0,
          // ),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      "Age: ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      "${widget.data.data!.raceCard!.rpAgesAllowedDesc!.substring(0, 1)} years old",
                      style: TextStyle(color: Color(0xff9AB5D1)),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "Distance: ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      "${widget.data.data!.raceCard!.distanceFurlongRounded}f",
                      style: TextStyle(color: Color(0xff9AB5D1)),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Prizes: ",
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prizeRow(
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![0]!.positionNo!
                          .toString()
                      : "1",
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![0]!.prizeSterling
                          .toString()
                      : "0.00"),
              prizeRow(
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![1]!.positionNo!
                          .toString()
                      : "2",
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![1]!.prizeSterling
                          .toString()
                      : "0.00"),
              prizeRow(
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![2]!.positionNo!
                          .toString()
                      : "3",
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![2]!.prizeSterling
                          .toString()
                      : "0.00"),
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prizeRow(
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![3]!.positionNo!
                          .toString()
                      : "4",
                  !emptyList
                      ? widget.data.data!.raceCard!.prizes![3]!.prizeSterling
                          .toString()
                      : "0.00"),
              // prizeRow("1", "AED 8000"),
              // prizeRow("1", "AED 8000"),
            ],
          ),
        ],
      ),
    );
  }

  Widget prizeRow(String index, String val) {
    val = formatCurrency.format(double.parse(val));
    val = val.substring(0, val.length - 3);
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 22.0,
            width: 22.0,
            decoration: BoxDecoration(
                color: Color(0xff1b5998),
                borderRadius: BorderRadius.circular(6.0)),
            child: Center(
              child: Text(
                index,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: AutoSizeText(
              "$val",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Color(0xff9AB5D1),
              ),
              minFontSize: 13,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ),
    );
  }
}
