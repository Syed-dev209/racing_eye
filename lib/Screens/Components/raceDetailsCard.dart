import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Models/raceRunnersModel.dart';
import 'package:racing_eye/Screens/horseDetails.dart';
import 'package:racing_eye/Screens/race_runner_details.dart';

import '../../main.dart';

class RaceDetailsCard extends StatefulWidget {
  // RaceRunnersModel data;
  // RaceDetailsCard({required this.data});
  int index;
  RaceRunnersModel runnerData;
  RaceDetailsCard({required this.index, required this.runnerData});
  @override
  _RaceDetailsCardState createState() => _RaceDetailsCardState();
}

class _RaceDetailsCardState extends State<RaceDetailsCard> {
  bool isOwner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.runnerData.inHouse! != "no") {
      isOwner = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        log(widget.runnerData.horseId.toString());
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>RaceRunnerDetailScreen(horseId: widget.runnerData.horseId.toString())));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        height: 140.0,
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
                      height: 40.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: SvgPicture.network(
                        "https://images.racingpost.com/svg/${widget.runnerData.silkImagePath}.svg",
                        fit: BoxFit.fill,
                        height: 40,
                        placeholderBuilder: (f) {
                          return Image.asset("images/defaultShirt.PNG");
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                       height: 20,
                        width: 20,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: myColor.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: AutoSizeText(
                            //"1000",
                             widget.index.toString(),
                            style: TextStyle(color: Colors.white,fontSize: 13),
                            minFontSize: 2,
                            maxLines: 1,
                            softWrap: true,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              widget.runnerData.horseName!,
                              style: TextStyle(
                                  fontSize: isOwner ? 20 : 19.0,
                                  fontWeight: FontWeight.bold,
                                  shadows: isOwner
                                      ? [
                                          Shadow(
                                            offset: Offset(1.5, 1.5),
                                            blurRadius: 2.5,
                                            color: Colors.black.withOpacity(0.6),
                                          ),
                                          // Shadow(
                                          //   offset: Offset(10.0, 10.0),
                                          //   blurRadius: 8.0,
                                          //   color: Color.fromARGB(125, 0, 0, 255),
                                          // ),
                                        ]
                                      : [
                                          Shadow(
                                            offset: Offset(0, 0),
                                            blurRadius: .0,
                                            //color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ]),
                              minFontSize: 5,
                              maxLines: 1,
                            ),
                          ),
                          isOwner
                              ? Icon(
                                  Icons.star,
                                  color: myColor.shade50,
                                  size: 18,
                                )
                              : Text('')
                        ],
                      ),
                      Text(
                        "${widget.runnerData.horseAge} Years old, ${widget.runnerData.horseColourCode} ${widget.runnerData.horseSexCode}",
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
                Expanded(
                  //flex: 2,
                  child: Row(
                    children: [
                      Text(
                        "Trainer: ",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        softWrap: false,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          widget.runnerData.trainerStylename!,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          minFontSize: 12,
                          softWrap: false,
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 30,
                // ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Jockey: ",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        //minFontSize: 12,
                        overflow: TextOverflow.clip,
                        softWrap: false,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          widget.runnerData.jockeyName ?? "N/A",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          softWrap: false,
                          overflow: TextOverflow.clip,
                          minFontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    "Owner: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      widget.runnerData.ownerName!,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      minFontSize: 12,
                      softWrap: false,
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
