import 'package:flutter/material.dart';
// import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Models/raceRunnersModel.dart';

import '../../main.dart';

class RaceDetailsCard extends StatefulWidget {
  // RaceRunnersModel data;
  // RaceDetailsCard({required this.data});

  @override
  _RaceDetailsCardState createState() => _RaceDetailsCardState();
}

class _RaceDetailsCardState extends State<RaceDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 150.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 65.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        image: DecorationImage(
                            image: AssetImage(
                              "images/pic.PNG",
                            ),
                            fit: BoxFit.fill)),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 13.0,
                      backgroundColor: myColor.shade100,
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vanusta",
                          style: TextStyle(
                              fontSize: 19.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: AssetImage("images/uaeFlag.jpg"),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                    Text(
                      "4 Years old, CH C",
                      style: TextStyle(color: myColor.shade50),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 1,
            width: double.maxFinite,
            color: Colors.grey[200],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      "Trainer: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      "Garry harrison",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "Jockey: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      "Rowen Scott",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "Owner: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  width: 3.0,
                ),
                Text(
                  "Miss harry harrison",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
