import 'package:flutter/cupertino.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class HorsesDetailModel {
  int? id;
  int? uid;
  String? horseName;
  String? horseCountryCode;
  String? horseDateOfBirth;
  String? horseDateOfDeath;
  String? horseAge;
  String? dateGelded;
  String? ownerName;
  int? ownerUid;
  String? trainerName;
  int? trainerUid;
  String? breederName;
  String? horseColourCode;
  String? horseSexCode;
  String? silkImagePath;
  String? createdAt;
  String? updatedAt;

  HorsesDetailModel({
    this.id,
    this.uid,
    this.horseName,
    this.horseCountryCode,
    this.horseDateOfBirth,
    this.horseDateOfDeath,
    this.horseAge,
    this.dateGelded,
    this.ownerName,
    this.ownerUid,
    this.trainerName,
    this.trainerUid,
    this.breederName,
    this.horseColourCode,
    this.horseSexCode,
    this.silkImagePath,
    this.createdAt,
    this.updatedAt,
  });
  HorsesDetailModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    uid = json["uid"]?.toInt();
    horseName = json["horse_name"]?.toString();
    horseCountryCode = json["horse_country_code"]?.toString();
    horseDateOfBirth = json["horse_date_of_birth"]?.toString();
    horseDateOfDeath = json["horse_date_of_death"]?.toString();
    horseAge = json["horse_age"]?.toString();
    dateGelded = json["date_gelded"]?.toString();
    ownerName = json["owner_name"]?.toString();
    ownerUid = json["owner_uid"]?.toInt();
    trainerName = json["trainer_name"]?.toString();
    trainerUid = json["trainer_uid"]?.toInt();
    breederName = json["breeder_name"]?.toString();
    horseColourCode = json["horse_colour_code"]?.toString();
    horseSexCode = json["horse_sex_code"]?.toString();
    silkImagePath = json["silk_image_path"]?.toString();
    createdAt = json["created_at"]?.toString();
    updatedAt = json["updated_at"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["uid"] = uid;
    data["horse_name"] = horseName;
    data["horse_country_code"] = horseCountryCode;
    data["horse_date_of_birth"] = horseDateOfBirth;
    data["horse_date_of_death"] = horseDateOfDeath;
    data["horse_age"] = horseAge;
    data["date_gelded"] = dateGelded;
    data["owner_name"] = ownerName;
    data["owner_uid"] = ownerUid;
    data["trainer_name"] = trainerName;
    data["trainer_uid"] = trainerUid;
    data["breeder_name"] = breederName;
    data["horse_colour_code"] = horseColourCode;
    data["horse_sex_code"] = horseSexCode;
    data["silk_image_path"] = silkImagePath;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class HorseDetailProvider extends ChangeNotifier {
  List<HorsesDetailModel> dataModel = [];
  addHorse(HorsesDetailModel data) {
    dataModel.add(data);
    notifyListeners();
  }
}