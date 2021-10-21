import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Models/raceRunnersModel.dart';

var dio = Dio();
getAvailableRaces(context) async {
  String url = "https://racingeye.ae/shadwell/races/available";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<AvailableRaceProvider>(context, listen: false).clearProvider();
    for (var i in decodedData) {
      Provider.of<AvailableRaceProvider>(context, listen: false)
          .addRace(RaceDetailsModel.fromJson(i));
    }
  }
}

getUpcomingRaces(context) async {
  String url = "https://racingeye.ae/shadwell/races/upcoming";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<UpcomingRaceProvider>(context, listen: false).clearProvider();
    for (var i in decodedData) {
      Provider.of<UpcomingRaceProvider>(context, listen: false)
          .addRace(RaceDetailsModel.fromJson(i));
    }
  }
}

getCompletedRaces(context) async {
  String url = "https://racingeye.ae/shadwell/races/completed";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<CompletedRaceProvider>(context, listen: false).clearProvider();
    for (var i in decodedData) {
      Provider.of<CompletedRaceProvider>(context, listen: false)
          .addRace(RaceDetailsModel.fromJson(i));
    }
  }
}

getRaceDescription({context, required String raceId}) async {
  String url = "https://re.victoriayachts.ae/api/?q=racecards/$raceId";
  // var response = await http.get(
  //     Uri.https(
  //         "https://racingeye.ae", "/shadwell/races/", {"race_id": raceId}),
  //     headers: {"Api-Key": apiKey});

  var response = await dio.get("https://racingeye.ae/shadwell/races/",
      queryParameters: {"race_id": raceId},
      options: Options(headers: {"Api-Key": apiKey}));
  if (response.statusCode == 200) {
    //var decodedData = jsonDecode(response.body);
    // print(response.data);
    List<RaceResultsModel> models = [];
    for (var i in response.data) {
      print(i);
      models.add(RaceResultsModel.fromJson(i));
    }
    Provider.of<RaceResultsProvider>(context, listen: false).clearProvider();
    //print(models.length);
    Provider.of<RaceResultsProvider>(context, listen: false)
        .addRaceDetails(models);
  }
}

Future<List<RaceRunnersModel>?> getRaceRunner(context, String raceId) async {
  String url = "https://re.victoriayachts.ae/api/?q=racecards/runners/$raceId";
  // var response = await http.get(
  //     Uri.https(
  //         "https://racingeye.ae", "/shadwell/runners/", {"race_id": raceId}),
  //     headers: {"Api-Key": apiKey});
  var response = await dio.get("https://racingeye.ae/shadwell/runners/",
      queryParameters: {"race_id": raceId},
      options: Options(headers: {"Api-Key": apiKey}));
  if (response.statusCode == 200) {
    List<RaceRunnersModel> models = [];
    for (var i in response.data) {
      models.add(RaceRunnersModel.fromJson(i));
    }
    print(models);
    return models;
    //var decodedData = jsonDecode(response.);
    // Provider.of<RaceResultsProvider>(context, listen: false)
    //     .addRaceRunners(models);
  } else {
    return null;
  }
}
