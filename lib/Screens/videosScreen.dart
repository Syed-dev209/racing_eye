import 'dart:async';
import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/videosController.dart';
import 'package:racing_eye/Models/videosModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/somethingWentWrong.dart';
import 'package:racing_eye/Screens/Components/videoWidget.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late StreamController<List<VideosModel>?> videosController;

  getVideos() {
    getAllVideos().then((value) {
      if (value != null) {
        videosController.add(value);
        return value;
      } else {
        videosController.add(null);
        return null;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    videosController = StreamController<List<VideosModel>?>();
    getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWhiteAppBar(
        headerText: "Live Streaming",
        showTrailing: false,
      ),
      body: SafeArea(
          child: StreamBuilder<List<VideosModel>?>(
        stream: videosController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null) {
            return SomethingWrongWidget(onReload: () {
              getVideos();
            });
          }
          return GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            crossAxisCount: 2,
            childAspectRatio: 0.83,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
                snapshot.data!.length,
                (index) => VideoWidget(
                      modelData: snapshot.data![index],
                    )),
          );
        },
      )),
    );
  }
}
