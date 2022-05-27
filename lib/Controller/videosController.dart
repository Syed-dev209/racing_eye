import 'package:dio/dio.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/videosModel.dart';
import 'package:racing_eye/Services/internet_connection.dart';

var dio = Dio(BaseOptions(headers: {"Api-Key": apiKey}));

Future<List<VideosModel>?> getAllVideos() async {
  try {
    bool check = await InternetService.checkConnectivity();
    if (check) {
      String url = "https://racingeye.ae/shadwell/videos";
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        List<VideosModel> modelList = [];

        for (var i in response.data) {
          modelList.add(VideosModel.fromJson(i));
        }
        return modelList;
      } else {
        return null;
      }
    } else {
      return null;
    }
  } on DioError catch (e) {
    return null;
  }
}
