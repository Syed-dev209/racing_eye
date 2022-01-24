class OwnerLast14Days {

  int? id;
  int? index;
  int? ownerUid;
  String? raceInstanceUid;
  String? courseRpAbbrev_3;
  String? raceOutcomeCode;
  String? horseStyleName;
  String? oddsDesc;
  String? raceDatetime;
  String? createdAt;
  String? updatedAt;
  String? distanceFurlong;
  String? noOfRunners;
  String? officialRatingRanOff;
  String? horseUid;

  OwnerLast14Days({
    this.id,
    this.ownerUid,
    this.raceInstanceUid,
    this.courseRpAbbrev_3,
    this.raceOutcomeCode,
    this.horseStyleName,
    this.oddsDesc,
    this.raceDatetime,
    this.createdAt,
    this.updatedAt,
    this.distanceFurlong,
    this.noOfRunners,
    this.officialRatingRanOff,
    this.horseUid,
  });
  OwnerLast14Days.fromJson(Map<String, dynamic> json) {
    if(json!=null) {
      id = int.parse(json["id"].toString());
      ownerUid = int.parse(json["owner_uid"].toString());
      raceInstanceUid = json["race_instance_uid"]?.toString();
      courseRpAbbrev_3 = json["course_rp_abbrev_3"]?.toString();
      raceOutcomeCode = json["race_outcome_code"]?.toString();
      horseStyleName = json["horse_style_name"]?.toString();
      oddsDesc = json["odds_desc"]?.toString();
      raceDatetime = json["race_datetime"]?.toString();
      createdAt = json["created_at"]?.toString();
      updatedAt = json["updated_at"]?.toString();
      distanceFurlong = json["distance_furlong"]?.toString();
      noOfRunners = json["no_of_runners"]?.toString();
      officialRatingRanOff = json["official_rating_ran_off"]?.toString();
      horseUid = json["horse_uid"]?.toString();
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["owner_uid"] = ownerUid;
    data["race_instance_uid"] = raceInstanceUid;
    data["course_rp_abbrev_3"] = courseRpAbbrev_3;
    data["race_outcome_code"] = raceOutcomeCode;
    data["horse_style_name"] = horseStyleName;
    data["odds_desc"] = oddsDesc;
    data["race_datetime"] = raceDatetime;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["distance_furlong"] = distanceFurlong;
    data["no_of_runners"] = noOfRunners;
    data["official_rating_ran_off"] = officialRatingRanOff;
    data["horse_uid"] = horseUid;
    return data;
  }
}
