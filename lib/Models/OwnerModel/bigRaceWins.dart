///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class BigRaceWinsModel {
/*
{
  "id": 361,
  "owner_uid": 302438,
  "horse_style_name": "Al Aasy",
  "race_instance_title": "Dubai Duty Free Finest Surprise Stakes (Registered As The John Porter Stakes) (Group 3)",
  "race_datetime": "2021-04-18 13:35:00",
  "trainer_style_name": "William Haggas",
  "prize_sterling": "25519.5",
  "created_at": "2021-10-16 10:23:45",
  "updated_at": "2021-10-16 10:23:45"
}
*/

  int? id;
  int? index;
  int? ownerUid;
  String? horseStyleName;
  String? raceInstanceTitle;
  String? raceInstanceUid;
  String? raceDatetime;
  String? trainerStyleName;
  String? prizeSterling;
  String? createdAt;
  String? updatedAt;

  BigRaceWinsModel(
      {this.id,
      this.ownerUid,
      this.horseStyleName,
      this.raceInstanceTitle,
      this.raceDatetime,
      this.trainerStyleName,
      this.prizeSterling,
      this.createdAt,
      this.updatedAt,
      this.raceInstanceUid});
  BigRaceWinsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    ownerUid = json["owner_uid"]?.toInt();
    horseStyleName = json["horse_style_name"]?.toString();
    raceInstanceTitle = json["race_instance_title"]?.toString();
    raceDatetime = json["race_datetime"]?.toString();
    trainerStyleName = json["trainer_style_name"]?.toString();
    prizeSterling = json["prize_sterling"]?.toString();
    createdAt = json["created_at"]?.toString();
    updatedAt = json["updated_at"]?.toString();
    raceInstanceUid = json["race_instance_uid"].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["owner_uid"] = ownerUid;
    data["horse_style_name"] = horseStyleName;
    data["race_instance_title"] = raceInstanceTitle;
    data["race_datetime"] = raceDatetime;
    data["trainer_style_name"] = trainerStyleName;
    data["prize_sterling"] = prizeSterling;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}
