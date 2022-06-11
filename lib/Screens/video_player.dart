import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:racing_eye/main.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  String videoUrl;
  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String dummyUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  initializePlayer() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    await videoPlayerController!.initialize();
    chewieController = ChewieController(
      fullScreenByDefault: true,
      placeholder: Center(
        child: SizedBox(
          height: 60,
          child: CircularProgressIndicator(),
        ),
      ),
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: false,
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePlayer();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: myColor,
          ),
        ),
      ),
      body: SafeArea(
        child: chewieController != null
            ? Chewie(
                controller: chewieController!,
              )
            : Center(
                child: SizedBox(
                height: 55,
                child: CircularProgressIndicator(),
              )),
      ),
    );
  }
}
