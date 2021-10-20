import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/OwnerModel/bigRaceWins.dart';
import 'package:racing_eye/Models/OwnerModel/horseModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/OwnerModel/ownerEntriesModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerLast14Days.dart';
import 'package:racing_eye/Models/OwnerModel/statsSummary.dart';

const String apiKey = "SYE0PzpfZy2nGQpeKo88TtYaIZUNeERt";

var dio = Dio();
Future getAllOwnerList(context) async {
  String url = "https://racingeye.ae/shadwell/owners";
  //var response = await http.get(Uri.parse(url), headers: {"Api-key": apiKey});
  var response =
      await dio.get(url, options: Options(headers: {"Api-key": apiKey}));
  if (response.statusCode == 200) {
    //var decodedData = jsonDecode(response.body);
    for (var data in response.data) {
      Provider.of<OwnerDataProvider>(context, listen: false)
          .addOwner(OwnersData.fromJson(data));
    }
  } else {}
}

Future<List<OwnerEntries>?> getOwnerEntries(int ownerId) async {
  // String url =
  //     "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/entries";
  try {
    // var response = await http.get(
    //     Uri.https("https://racingeye.ae", "/shadwell/owner/entries",
    //         {"owner_id": ownerId}),
    //     headers: {"Api-Key": apiKey});

    var response = await dio.get("https://racingeye.ae/shadwell/owner/entries",
        queryParameters: {"owner_id": ownerId},
        options: Options(headers: {"Api-Key": apiKey}));
    if (response.statusCode == 200) {
      // var decodedData = jsonDecode(response.body);
      print("OWNER ENTRIES===>${response.data}");
      List<OwnerEntries> models = [];
      for (var i in response.data) {
        models.add(OwnerEntries.fromJson(i));
      }
      return models;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future<List<OwnerLast14Days>?> getOwnerLast14DaysData(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/last_14_days";
  try {
    // var response = await http.get(
    //     Uri.https("https://racingeye.ae", "/shadwell/owner/forms",
    //         {"owner_id": ownerId}),
    //     headers: {"Api-Key": apiKey});
    var response = await dio.get("https://racingeye.ae/shadwell/owner/forms",
        queryParameters: {"owner_id": ownerId},
        options: Options(headers: {"Api-Key": apiKey}));

    print("OWNER FORM===>${response.data}");
    List<OwnerLast14Days> models = [];
    for (var i in response.data) {
      models.add(OwnerLast14Days.fromJson(i));
    }
    // var decodeData = jsonDecode(response.body);
    return models;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List<StatsSummary>?> getOwnerStatsSummary(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/statistical_summary";
  //try {
  // var response = await http.get(
  //     Uri.https(
  //         "https://racingeye.ae", "/shadwell/stats", {"owner_id": ownerId}),
  //     headers: {"Api-Key": apiKey});
  var response = await dio.get("https://racingeye.ae/shadwell/stats",
      queryParameters: {"owner_id": ownerId},
      options: Options(headers: {"Api-Key": apiKey}));

  print("OWNER STATS===>${response.data}");
  List<StatsSummary> models = [];
  for (var i in response.data) {
    models.add(StatsSummary.fromJson(i));
  }

  return models;

  // } catch (e) {
  //   print("Error in getting stats summary :- $e");
  //   return null;
  // }
}

Future<List<BigRaceWinsModel>?> getOwnerBigRaceWins(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/big_race_wins";
  //try {
  // var response = await http.get(
  //     Uri.https("https://racingeye.ae", "/shadwell/owner/bigwins",
  //         {"owner_id": ownerId}),
  //     headers: {"Api-Key": apiKey});
  var response = await dio.get("https://racingeye.ae/shadwell/owner/bigwins",
      queryParameters: {"owner_id": ownerId},
      options: Options(headers: {"Api-Key": apiKey}));
  if (response.statusCode == 200) {
    //var decodedData = jsonDecode(response.body);
    print("OWNER BIG RACE===>${response.data}");
    List<BigRaceWinsModel> models = [];
    for (var i in response.data) {
      models.add(BigRaceWinsModel.fromJson(i));
    }
    return models;
  } else {
    return null;
  }
  // } catch (e) {
  //   print("Error in getting big race data :- $e");
  //   return null;
  // }
}

///remaining ----------------------------
Future<List<HorseModel>?> getOwnerHorses(int ownerId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/owner/$ownerId/horses";
  //try{
  //var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});

  var response = await dio.get("https://racingeye.ae/shadwell/horses/",
      queryParameters: {"owner_id": ownerId},
      options: Options(headers: {"Api-Key": apiKey}));
  if (response.statusCode == 200) {
    //var decodedData = jsonDecode(response.body);
    List<HorseModel> models = [];
    for (var i in response.data) {
      models.add(HorseModel.fromJson(i));
    }
    return models;
  } else {
    return null;
  }
  //}
  // catch(e){
  //   print("Error in getting horses list :- $e");
  //   return  null;
  // }
}
