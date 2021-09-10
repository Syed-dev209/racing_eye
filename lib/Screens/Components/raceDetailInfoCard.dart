import 'package:flutter/material.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime = DateTime.parse(widget.data.data!.raceCard!.raceDatetime!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: myColor.shade50, borderRadius: BorderRadius.circular(18.0)),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.data.data!.raceCard!.raceInstanceTitle!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                  softWrap: false,
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
          SizedBox(
            height: 10.0,
          ),
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
          SizedBox(
            height: 10.0,
          ),
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
                width: 18.0,
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
            height: 15,
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
                  widget.data.data!.raceCard!.prizes![0]!.positionNo!
                      .toString(),
                  widget.data.data!.raceCard!.prizes![0]!.prizeSterling
                      .toString()),
              prizeRow(
                  widget.data.data!.raceCard!.prizes![1]!.positionNo!
                      .toString(),
                  widget.data.data!.raceCard!.prizes![1]!.prizeSterling
                      .toString()),
              prizeRow(
                  widget.data.data!.raceCard!.prizes![2]!.positionNo!
                      .toString(),
                  widget.data.data!.raceCard!.prizes![2]!.prizeSterling
                      .toString()),
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prizeRow(
                  widget.data.data!.raceCard!.prizes![3]!.positionNo!
                      .toString(),
                  widget.data.data!.raceCard!.prizes![3]!.prizeSterling
                      .toString()),
              // prizeRow("1", "AED 8000"),
              // prizeRow("1", "AED 8000"),
            ],
          ),
        ],
      ),
    );
  }

  Widget prizeRow(String index, String val) {
    return Container(
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
                "1",
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
          Text(
            "AED 8000",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Color(0xff9AB5D1)),
          )
        ],
      ),
    );
  }
}
