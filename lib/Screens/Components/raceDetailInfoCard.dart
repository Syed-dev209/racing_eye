import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerTables.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  String? time;
  late String date;
  late String month;
  String? videoId;
  YoutubePlayerController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime = DateTime.parse(widget.data.raceDatetime!);
    var temp = DateTime.parse(widget.data.raceDatetime! + 'Z');
    print(temp);
    var dateTimeCheck =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(temp.toString(), true);
    var dateLocal = dateTimeCheck.toLocal();
    print(dateLocal);
    String minute = dateLocal.minute.toString();
    time = "${dateLocal.hour}:${minute.length == 2 ? minute : "0$minute"} ";
    date = "${dateLocal.day}";
    month = monthList[dateLocal.month - 1];
    // if (widget.data.prizes!.isEmpty) {
    //   setState(() {
    //     emptyList = true;
    //   });
    // }

    if (widget.data.videoLink != null ||
        (widget.data.videoLink?.isNotEmpty ?? false)) {
      videoId = YoutubePlayer.convertUrlToId(widget.data.videoLink ??
              "https://www.youtube.com/watch?v=wnkBaoy6OmQ") ??
          "";
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(hideThumbnail: true, enableCaption: false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: myColor.shade50, borderRadius: BorderRadius.circular(18.0)),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AutoSizeText(
                  widget.data.raceInstanceTitle!,
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
                      "$time",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
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
                    Image.asset("images/calenderWhite.png"),
                    SizedBox(width: 5),
                    Text(
                      "$date $month",
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
                "Course: ${widget.data.courseStyleName ?? "N/A"}",
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
                      "${widget.data.rpAgesAllowedDesc!.substring(0, 1)} years old",
                      style: TextStyle(color: Color(0xff9AB5D1)),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Container(
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
                      Expanded(
                        child: Text(
                          "${widget.data.distanceFurlongRounded ?? "0"}m",
                          style: TextStyle(color: Color(0xff9AB5D1)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (widget.data.videoLink != null ||
                  (widget.data.videoLink?.isNotEmpty ?? false))
                Tooltip(
                  message: 'Go to video',
                  child: GestureDetector(
                    onTap: () {
                      playVideo();
                    },
                    child: Icon(
                      Icons.ondemand_video,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // Text(
          //   "Prizes: ",
          //   style: TextStyle(
          //       color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(
          //   height: 5.0,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     prizeRow(
          //         !emptyList
          //             ? widget.data.prizes![0].positionNo!.toString()
          //             : "1",
          //         !emptyList
          //             ? widget.data.prizes![0].prizeSterling.toString()
          //             : "0.00"),
          //     prizeRow(
          //         !emptyList
          //             ? widget.data.prizes![1].positionNo.toString()
          //             : "2",
          //         !emptyList
          //             ? widget.data.prizes![1].prizeSterling.toString()
          //             : "0.00"),
          //     prizeRow(
          //         !emptyList
          //             ? widget.data.prizes![2].positionNo!.toString()
          //             : "3",
          //         !emptyList
          //             ? widget.data.prizes![2].prizeSterling.toString()
          //             : "0.00"),
          //   ],
          // ),
          // SizedBox(
          //   height: 7.0,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     prizeRow(
          //         !emptyList
          //             ? widget.data.prizes![3].positionNo!.toString()
          //             : "4",
          //         !emptyList
          //             ? widget.data.prizes![3].prizeSterling.toString()
          //             : "0.00"),
          //     // prizeRow("1", "AED 8000"),
          //     // prizeRow("1", "AED 8000"),
          //   ],
          // ),
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

  playVideo() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: double.maxFinite,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller!,
              ),
              builder: (context, player) {
                return player;
              },
            ),
          );
        });
  }
}
