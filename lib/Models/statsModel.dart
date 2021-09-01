import 'package:flutter/cupertino.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class StatsModel {
  String? year;
  String? wins;
  String? runs;
  String? percentWinsRuns;
  String? earnings;
  String? stake;

  StatsModel({
    this.year,
    this.wins,
    this.runs,
    this.percentWinsRuns,
    this.earnings,
    this.stake,
  });
  StatsModel.fromJson(Map<String, dynamic> json) {
    year = json["year"]?.toString();
    wins = json["wins"]?.toString();
    runs = json["runs"]?.toString();
    percentWinsRuns = json["percent_wins_runs"]?.toString();
    earnings = json["earnings"]?.toString();
    stake = json["stake"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["year"] = year;
    data["wins"] = wins;
    data["runs"] = runs;
    data["percent_wins_runs"] = percentWinsRuns;
    data["earnings"] = earnings;
    data["stake"] = stake;
    return data;
  }
}

class StatsProvider extends ChangeNotifier {
  StatsModel? data;
  setStatsData(StatsModel dat) {
    data = dat;
    print(data!.year);
    notifyListeners();
  }

  get getStatsData {
    return data;
  }
}