///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class RaceRunnersModel {
/*
{
  "id": 1069,
  "runnder_id": "",
  "start_number": "1",
  "draw": "0",
  "horse_name": "Addeybb",
  "horse_age": "7",
  "horse_colour_code": "CH",
  "horse_sex_code": "G",
  "jockey_name": "Tom Marquand",
  "trainer_stylename": "William Haggas",
  "created_at": "2021-10-12 19:23:36",
  "updated_at": "2021-10-12 19:23:36",
  "owner_name": "Sheikh Ahmed Al Maktoum",
  "silk_image_path": "https://images.racingpost.com/svg/1/8/7/14781.svg",
  "race_instance_uid": "789169"
}
*/

  int? id;
  String? runnderId;
  String? startNumber;
  String? draw;
  String? horseName;
  String? horseAge;
  String? horseColourCode;
  String? horseSexCode;
  String? jockeyName;
  String? trainerStylename;
  String? createdAt;
  String? updatedAt;
  String? ownerName;
  String? silkImagePath;
  String? raceInstanceUid;
  String? inHouse;
  String? horseId;

  RaceRunnersModel(
      {this.id,
      this.runnderId,
      this.startNumber,
      this.draw,
      this.horseName,
      this.horseAge,
      this.horseColourCode,
      this.horseSexCode,
      this.jockeyName,
      this.trainerStylename,
      this.createdAt,
      this.updatedAt,
      this.ownerName,
      this.silkImagePath,
      this.raceInstanceUid,
      this.inHouse,
        this.horseId
      });
  RaceRunnersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    runnderId = json["runnder_id"]?.toString();
    startNumber = json["start_number"]?.toString();
    draw = json["draw"]?.toString();
    horseName = json["horse_name"]?.toString();
    horseAge = json["horse_age"]?.toString();
    horseColourCode = json["horse_colour_code"]?.toString();
    horseSexCode = json["horse_sex_code"]?.toString();
    jockeyName = json["jockey_name"]?.toString();
    trainerStylename = json["trainer_stylename"]?.toString();
    createdAt = json["created_at"]?.toString();
    updatedAt = json["updated_at"]?.toString();
    ownerName = json["owner_name"]?.toString();
    silkImagePath = json["silk_image_path"]?.toString();
    raceInstanceUid = json["race_instance_uid"]?.toString();
    inHouse = json["inhouse"].toString();
    horseId = json["horse_uid"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["runnder_id"] = runnderId;
    data["start_number"] = startNumber;
    data["draw"] = draw;
    data["horse_name"] = horseName;
    data["horse_age"] = horseAge;
    data["horse_colour_code"] = horseColourCode;
    data["horse_sex_code"] = horseSexCode;
    data["jockey_name"] = jockeyName;
    data["trainer_stylename"] = trainerStylename;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["owner_name"] = ownerName;
    data["silk_image_path"] = silkImagePath;
    data["race_instance_uid"] = raceInstanceUid;
    return data;
  }
}
