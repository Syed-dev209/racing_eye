import 'package:flutter/material.dart';
import 'package:racing_eye/main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubeplayer extends StatefulWidget {
  final YoutubePlayerController controller;
  const CustomYoutubeplayer({Key? key, required this.controller})
      : super(key: key);

  @override
  State<CustomYoutubeplayer> createState() => _CustomYoutubeplayerState();
}

class _CustomYoutubeplayerState extends State<CustomYoutubeplayer> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        appBar: orientation == Orientation.portrait
            ? PreferredSize(
                preferredSize: Size(double.maxFinite, 56),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: myColor),
                ),
              )
            : null,
        body: SafeArea(
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: widget.controller,
            ),
            builder: (context, player) {
              return player;
            },
          ),
        ),
      );
    });
  }
}
