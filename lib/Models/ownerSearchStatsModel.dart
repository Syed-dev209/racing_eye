import 'package:flutter/cupertino.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class OwnerSearchStatsModel {
/*
{
  "owner_style_name": "Shadwell Estate Company Ltd",
  "year": "2021",
  "country_code": "IRE",
  "race_type": "Flat",
  "wins": 5,
  "runs": 75,
  "percent_wins_runs": "7",
  "earnings": "114258.93",
  "stake": "-40.43"
}
*/

  String? ownerStyleName;
  String? year;
  String? countryCode;
  String? raceType;
  int? wins;
  int? runs;
  String? percentWinsRuns;
  String? earnings;
  String? stake;

  OwnerSearchStatsModel({
    this.ownerStyleName,
    this.year,
    this.countryCode,
    this.raceType,
    this.wins,
    this.runs,
    this.percentWinsRuns,
    this.earnings,
    this.stake,
  });
  OwnerSearchStatsModel.fromJson(Map<String, dynamic> json) {
    ownerStyleName = json["owner_style_name"]?.toString();
    year = json["year"]?.toString();
    countryCode = json["country_code"]?.toString();
    raceType = json["race_type"]?.toString();
    wins = json["wins"]?.toInt();
    runs = json["runs"]?.toInt();
    percentWinsRuns = json["percent_wins_runs"]?.toString();
    earnings = json["earnings"]?.toString();
    stake = json["stake"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["owner_style_name"] = ownerStyleName;
    data["year"] = year;
    data["country_code"] = countryCode;
    data["race_type"] = raceType;
    data["wins"] = wins;
    data["runs"] = runs;
    data["percent_wins_runs"] = percentWinsRuns;
    data["earnings"] = earnings;
    data["stake"] = stake;
    return data;
  }
}

class OwnerSearchStatsProvider extends ChangeNotifier {
  List<OwnerSearchStatsModel> dataList = [];

  addOwnerStats(OwnerSearchStatsModel data) {
    dataList.add(data);
    notifyListeners();
  }

  clearList() {
    dataList.clear();
    notifyListeners();
  }
}
