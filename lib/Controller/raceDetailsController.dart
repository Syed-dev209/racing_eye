import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Models/raceRunnersModel.dart';

getAvailableRaces(context) async {
  String url = "https://re.victoriayachts.ae/races/available";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    for (var i in decodedData) {
      Provider.of<AvailableRaceProvider>(context, listen: false)
          .addRace(RaceDetailsModel.fromJson(i));
    }
  }
}

getUpcomingRaces(context) async {
  String url = "https://re.victoriayachts.ae/races/upcoming";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    for (var i in decodedData) {
      Provider.of<UpcomingRaceProvider>(context, listen: false)
          .addRace(RaceDetailsModel.fromJson(i));
    }
  }
}

getCompletedRaces(context) async {
  String url = "https://re.victoriayachts.ae/races/completed";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    for (var i in decodedData) {
      Provider.of<CompletedRaceProvider>(context, listen: false)
          .addRace(RaceDetailsModel.fromJson(i));
    }
  }
}

getRaceDescription({context, required String raceId}) async {
  String url = "https://re.victoriayachts.ae/api/?q=racecards/$raceId";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<RaceResultsProvider>(context, listen: false)
        .addRaceDetails(RaceResultsModel.fromJson(decodedData));
  }
}

getRaceRunner(context, String raceId) async {
  String url = "https://re.victoriayachts.ae/api/?q=racecards/runners/$raceId";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<RaceResultsProvider>(context, listen: false)
        .addRaceRunners(RaceRunnersModel.fromJson(decodedData));
  }
}
