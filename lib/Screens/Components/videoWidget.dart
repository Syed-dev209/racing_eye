import 'package:flutter/material.dart';
import 'package:racing_eye/Models/videosModel.dart';
import 'package:racing_eye/Screens/youtube_player.dart';
import 'package:racing_eye/main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  final VideosModel modelData;
  const VideoWidget({Key? key, required this.modelData}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late String videoId;
  late YoutubePlayerController _controller;
  late String thumbnail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.modelData.link ??
            "https://www.youtube.com/watch?v=wnkBaoy6OmQ") ??
        "";
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(hideThumbnail: true, enableCaption: false),
    );

    thumbnail = getYoutubeThumbnail(widget.modelData.link ??
            "https://www.youtube.com/watch?v=wnkBaoy6OmQ") ??
        "https://img.youtube.com/vi/wnkBaoy6OmQ/0.jpg";
  }

  String? getYoutubeThumbnail(String videoUrl) {
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return null;
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CustomYoutubeplayer(controller: _controller)));
      },
      child: Container(
        height: 205,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14)),
              child: Center(
                child: Image.network(
                  thumbnail,
                  height: 139,
                  cacheHeight: 139,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                widget.modelData.title ?? "N/A",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                widget.modelData.description ?? "N/A",
                style: TextStyle(fontSize: 14, color: myColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
