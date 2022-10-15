import 'package:dio/dio.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';

var dio = Dio();

Future globallySearch(String type, String keyword) async {
  try {
    String url = "https://racingeye.ae/shadwell/search";

    var response = await dio.get(url,
        queryParameters: {"type": type, "keyword": keyword},
        options: Options(headers: {"Api-key": apiKey}));
    if (response.statusCode == 200) {
      if (type == "horse") {
        ///horse
        List<HorsesDetailModel> horseDataList = [];
        for (var i in response.data) {
          horseDataList.add(HorsesDetailModel.fromJson(i));
        }
        return horseDataList;
      } else if (type == "owner") {
        ///owner
        List<OwnersData> ownerDataList = [];
        for (var i in response.data) {
          ownerDataList.add(OwnersData.fromJson(i));
        }
        return ownerDataList;
      } else if (type == "race") {
        ///race
        List<RaceDetailsModel> raceDataList = [];
        for (var i in response.data) {
          raceDataList.add(RaceDetailsModel.fromJson(i));
        }
        return raceDataList;
      } else {
        ///type=jockey
        List<RaceDetailsModel> jockeyDataList = [];
        for (var i in response.data) {
          jockeyDataList.add(RaceDetailsModel.fromJson(i));
        }
        return jockeyDataList;
      }
    } else {
      return null;
    }
  } on DioError catch (_) {
    return null;
  }
}
