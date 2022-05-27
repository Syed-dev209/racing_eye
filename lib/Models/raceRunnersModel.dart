///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class RaceRunnersModel {
/*
{
  "start_number": 1,
  "draw": "0",
  "horse_name": "Adayar",
  "horse_age": "4",
  "horse_colour_code": "B",
  "horse_sex_code": "C",
  "jockey_name": null,
  "trainer_stylename": "Charlie Appleby",
  "owner_name": "Godolphin",
  "silk_image_path": "5/4/8/49845",
  "race_instance_uid": "808803",
  "horse_uid": "3241310",
  "winning_position": 1000,
  "inhouse": "no",
  "running_status": "A"
} 
*/

  int? startNumber;
  String? draw;
  String? horseName;
  String? horseAge;
  String? horseColourCode;
  String? horseSexCode;
  String? jockeyName;
  String? trainerStylename;
  String? ownerName;
  String? silkImagePath;
  String? raceInstanceUid;
  String? horseUid;
  int? winningPosition;
  String? inhouse;
  String? runningStatus;

  RaceRunnersModel({
    this.startNumber,
    this.draw,
    this.horseName,
    this.horseAge,
    this.horseColourCode,
    this.horseSexCode,
    this.jockeyName,
    this.trainerStylename,
    this.ownerName,
    this.silkImagePath,
    this.raceInstanceUid,
    this.horseUid,
    this.winningPosition,
    this.inhouse,
    this.runningStatus,
  });
  RaceRunnersModel.fromJson(Map<String, dynamic> json) {
    startNumber = json['start_number']?.toInt();
    draw = json['draw']?.toString();
    horseName = json['horse_name']?.toString();
    horseAge = json['horse_age']?.toString();
    horseColourCode = json['horse_colour_code']?.toString();
    horseSexCode = json['horse_sex_code']?.toString();
    jockeyName = json['jockey_name']?.toString();
    trainerStylename = json['trainer_stylename']?.toString();
    ownerName = json['owner_name']?.toString();
    silkImagePath = json['silk_image_path']?.toString();
    raceInstanceUid = json['race_instance_uid']?.toString();
    horseUid = json['horse_uid']?.toString();
    winningPosition = json['winning_position']?.toInt();
    inhouse = json['inhouse']?.toString();
    runningStatus = json['running_status']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['start_number'] = startNumber;
    data['draw'] = draw;
    data['horse_name'] = horseName;
    data['horse_age'] = horseAge;
    data['horse_colour_code'] = horseColourCode;
    data['horse_sex_code'] = horseSexCode;
    data['jockey_name'] = jockeyName;
    data['trainer_stylename'] = trainerStylename;
    data['owner_name'] = ownerName;
    data['silk_image_path'] = silkImagePath;
    data['race_instance_uid'] = raceInstanceUid;
    data['horse_uid'] = horseUid;
    data['winning_position'] = winningPosition;
    data['inhouse'] = inhouse;
    data['running_status'] = runningStatus;
    return data;
  }
}
