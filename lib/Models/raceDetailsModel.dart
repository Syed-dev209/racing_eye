import 'package:flutter/cupertino.dart';

class RaceDetailsModel {
  int? id;
  String? raceInstanceUid;
  String? horseUid;
  String? horseName;
  String? raceDatetime;
  String? courseName;
  String? courseStyleName;
  String? raceStatusCode;
  int? ownerId;
  String? raceInstanceTitle;
  String? createdAt;
  String? updatedAt;
  String? ownerName;
  String? courseImage;
  String? courseCountryCode;

  RaceDetailsModel(
      {this.id,
      this.raceInstanceUid,
      this.horseUid,
      this.horseName,
      this.raceDatetime,
      this.courseName,
      this.courseStyleName,
      this.raceStatusCode,
      this.ownerId,
      this.raceInstanceTitle,
      this.createdAt,
      this.updatedAt,
      this.ownerName,
      this.courseImage,
        this.courseCountryCode
      });
  RaceDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    raceInstanceUid = json["race_instance_uid"]?.toString();
    horseUid = json["horse_uid"]?.toString();
    horseName = json["horse_name"]?.toString();
    raceDatetime = json["race_datetime"]?.toString();
    courseName = json["course_name"]?.toString();
    courseStyleName = json["course_style_name"]?.toString();
    raceStatusCode = json["race_status_code"]?.toString();
    ownerId = json["ownerId"]?.toInt();
    raceInstanceTitle = json["race_instance_title"]?.toString();
    createdAt = json["created_at"]?.toString();
    updatedAt = json["updated_at"]?.toString();
    ownerName = json["ownerName"]?.toString();
    courseImage = json["course_image"]?.toString();
    courseCountryCode = json["course_country_code"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["race_instance_uid"] = raceInstanceUid;
    data["horse_uid"] = horseUid;
    data["horse_name"] = horseName;
    data["race_datetime"] = raceDatetime;
    data["course_name"] = courseName;
    data["course_style_name"] = courseStyleName;
    data["race_status_code"] = raceStatusCode;
    data["ownerId"] = ownerId;
    data["race_instance_title"] = raceInstanceTitle;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["ownerName"] = ownerName;
    return data;
  }
}

class AvailableRaceProvider extends ChangeNotifier {
  List<RaceDetailsModel> availRaces = [];
  addRace(RaceDetailsModel data) {
    availRaces.add(data);
    notifyListeners();
  }

  clearProvider() {
    availRaces.clear();
  }
}

class UpcomingRaceProvider extends ChangeNotifier {
  List<RaceDetailsModel> comingRaces = [];
  addRace(RaceDetailsModel data) {
    comingRaces.add(data);
    notifyListeners();
  }

  clearProvider() {
    comingRaces.clear();
  }
}

class CompletedRaceProvider extends ChangeNotifier {
  List<RaceDetailsModel> completeRaces = [];
  addRace(RaceDetailsModel data) {
    completeRaces.add(data);
    notifyListeners();
  }

  addList(List<RaceDetailsModel> list) {
    completeRaces = list;
    notifyListeners();
  }

  clearProvider() {
    completeRaces.clear();
  }
}
