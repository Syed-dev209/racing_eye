import 'package:flutter/material.dart';
class HorseProfileModel {
  int? id;
  int? uid;
  String? horseName;
  String? horseCountryOriginCode;
  String? horseDateOfBirth;
  String? horseDateOfDeath;
  String? age;
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
  String? sireHorseName;
  String? damSireHorseName;
  String? siresSireName;
  String? damHorseName;
  String? place_1stNumber;
  String? racesNumber;
  String? netTotalPrizeMoney;

  HorseProfileModel({
    this.id,
    this.uid,
    this.horseName,
    this.horseCountryOriginCode,
    this.horseDateOfBirth,
    this.horseDateOfDeath,
    this.age,
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
    this.sireHorseName,
    this.damSireHorseName,
    this.siresSireName,
    this.damHorseName,
    this.place_1stNumber,
    this.racesNumber,
    this.netTotalPrizeMoney,
  });
  HorseProfileModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    uid = json["uid"]?.toInt();
    horseName = json["horse_name"]?.toString();
    horseCountryOriginCode = json["horse_country_origin_code"]?.toString();
    horseDateOfBirth = json["horse_date_of_birth"]?.toString();
    horseDateOfDeath = json["horse_date_of_death"]?.toString();
    age = json["age"]?.toString();
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
    sireHorseName = json["sire_horse_name"]?.toString();
    damSireHorseName = json["dam_sire_horse_name"]?.toString();
    siresSireName = json["sires_sire_name"]?.toString();
    damHorseName = json["dam_horse_name"]?.toString();
    place_1stNumber = json["place_1st_number"]?.toString();
    racesNumber = json["races_number"]?.toString();
    netTotalPrizeMoney = json["net_total_prize_money"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["uid"] = uid;
    data["horse_name"] = horseName;
    data["horse_country_origin_code"] = horseCountryOriginCode;
    data["horse_date_of_birth"] = horseDateOfBirth;
    data["horse_date_of_death"] = horseDateOfDeath;
    data["age"] = age;
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
    data["sire_horse_name"] = sireHorseName;
    data["dam_sire_horse_name"] = damSireHorseName;
    data["sires_sire_name"] = siresSireName;
    data["dam_horse_name"] = damHorseName;
    data["place_1st_number"] = place_1stNumber;
    data["races_number"] = racesNumber;
    data["net_total_prize_money"] = netTotalPrizeMoney;
    return data;
  }
}

class HorseProfileProvider extends ChangeNotifier {
  HorseProfileModel? profile;
  addProfile(HorseProfileModel? data) {
    print("====>$data");
    if(data!=null) {
      profile = data;
    }
    notifyListeners();
  }

  clearProvider() {
    profile = null;
    notifyListeners();
  }
}
