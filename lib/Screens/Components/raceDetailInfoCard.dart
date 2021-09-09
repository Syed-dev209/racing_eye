import 'package:flutter/material.dart';

import '../../main.dart';

class RaceDetailsInfoCard extends StatefulWidget {
  const RaceDetailsInfoCard({Key? key}) : super(key: key);

  @override
  _RaceDetailsInfoCardState createState() => _RaceDetailsInfoCardState();
}

class _RaceDetailsInfoCardState extends State<RaceDetailsInfoCard> {
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
              Text(
                "Sharjah",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold),
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
                      "19:00",
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
                      "09 March",
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
                "Sponsored By: N/A",
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
                      "3+ years old",
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
                      "3m 1f",
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
              prizeRow("1", "AED 8000"),
              prizeRow("1", "AED 8000"),
              prizeRow("1", "AED 8000"),
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prizeRow("1", "AED 8000"),
              prizeRow("1", "AED 8000"),
              prizeRow("1", "AED 8000"),
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
