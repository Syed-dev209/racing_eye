import 'dart:convert';

import 'package:racing_eye/Models/OwnerModels/bigRaceWins.dart';
import 'package:racing_eye/Models/OwnerModels/horseModel.dart';
import 'package:racing_eye/Models/OwnerModels/ownerData.dart';
import 'package:http/http.dart' as http;
import 'package:racing_eye/Models/OwnerModels/ownerEntriesModel.dart';
import 'package:racing_eye/Models/OwnerModels/ownerLast14Days.dart';
import 'package:racing_eye/Models/OwnerModels/statsSummary.dart';

const String apiKey = "SYE0PzpfZy2nGQpeKo88TtYaIZUNeERt";

Future<List<OwnersData>> getAllOwnerList() async {
  List<OwnersData> ownerList = [];
  String url = "https://re.victoriayachts.ae/owners";
  var response = await http.get(Uri.parse(url), headers: {"Api-key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    for (var data in decodedData) {
      ownerList.add(OwnersData.fromJson(data));
    }
  } else {
    print("response failed");
  }
  return ownerList;
}

Future<OwnerEntries?> getOwnerEntries(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/entries";
  try {
    var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return OwnerEntries.fromJson(decodedData);
    } else {
      return null;
    }
  } catch (e) {
    print("Error in getting entries:- $e");
    return null;
  }
}

Future<OwnerLast14Days?> getOwnerLast14DaysData(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/last_14_days";
  try {
    var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      return OwnerLast14Days.fromJson(decodeData);
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<StatsSummary?> getOwnerStatsSummary(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/statistical_summary";
  //try {
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    return StatsSummary.fromJson(decodedData);
  } else {
    return null;
  }
  // } catch (e) {
  //   print("Error in getting stats summary :- $e");
  //   return null;
  // }
}

Future<BigRaceWinsModel?> getOwnerBigRaceWins(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/big_race_wins";
  //try {
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    return BigRaceWinsModel.fromJson(decodedData);
  } else {
    return null;
  }
  // } catch (e) {
  //   print("Error in getting big race data :- $e");
  //   return null;
  // }
}

Future<HorseModel?> getOwnerHorses(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/horses";
  //try{
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    return HorseModel.fromJson(decodedData);
  } else {
    return null;
  }
  //}
  // catch(e){
  //   print("Error in getting horses list :- $e");
  //   return  null;
  // }
}
