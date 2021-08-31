class BigRaceWinsModel {
  Data? data;
  int? status;

  BigRaceWinsModel({this.data, this.status});

  BigRaceWinsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<BigRaceWin>? bigRaceWins;

  Data({this.bigRaceWins});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['big_race_wins'] != null) {
      bigRaceWins = [];
      json['big_race_wins'].forEach((v) {
        bigRaceWins!.add(new BigRaceWin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bigRaceWins != null) {
      data['big_race_wins'] = this.bigRaceWins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BigRaceWin {
  int index = 0;
  String? raceDate;
  String? rpAbbrev3;
  String? country;
  int? distanceYard;
  double? distanceFurlongRounded;
  int? raceInstanceUid;
  String? raceInstanceTitle;
  double? prizeSterling;
  int? prizeEuro;
  int? daysDiff;
  String? raceOutcomeCode;
  int? raceOutcomePosition;
  dynamic disqDesc;
  String? horseStyleName;
  int? horseUid;
  String? trainerPtpTypeCode;
  String? trainerStyleName;
  int? trainerUid;
  String? raceTypeCode;
  String? raceGroupDesc;
  String? raceGroupCode;
  int? courseUid;
  String? courseTypeCode;
  String? courseName;
  String? courseStyleName;
  String? trainerShortName;

  BigRaceWin(
      {this.raceDate,
      this.rpAbbrev3,
      this.country,
      this.distanceYard,
      this.distanceFurlongRounded,
      this.raceInstanceUid,
      this.raceInstanceTitle,
      this.prizeSterling,
      this.prizeEuro,
      this.daysDiff,
      this.raceOutcomeCode,
      this.raceOutcomePosition,
      this.disqDesc,
      this.horseStyleName,
      this.horseUid,
      this.trainerPtpTypeCode,
      this.trainerStyleName,
      this.trainerUid,
      this.raceTypeCode,
      this.raceGroupDesc,
      this.raceGroupCode,
      this.courseUid,
      this.courseTypeCode,
      this.courseName,
      this.courseStyleName,
      this.trainerShortName});

  BigRaceWin.fromJson(Map<String, dynamic> json) {
    raceDate = json['race_date'];
    rpAbbrev3 = json['rp_abbrev_3'];
    country = json['country'];
    distanceYard = json['distance_yard'];
    distanceFurlongRounded =
        double.parse(json['distance_furlong_rounded'].toString());
    raceInstanceUid = json['race_instance_uid'];
    raceInstanceTitle = json['race_instance_title'];
    prizeSterling = double.parse(json['prize_sterling'].toString());
    prizeEuro = json['prize_euro'];
    daysDiff = json['days_diff'];
    raceOutcomeCode = json['race_outcome_code'];
    raceOutcomePosition = json['race_outcome_position'];
    disqDesc = json['disq_desc'];
    horseStyleName = json['horse_style_name'];
    horseUid = json['horse_uid'];
    trainerPtpTypeCode = json['trainer_ptp_type_code'];
    trainerStyleName = json['trainer_style_name'];
    trainerUid = json['trainer_uid'];
    raceTypeCode = json['race_type_code'];
    raceGroupDesc = json['race_group_desc'];
    raceGroupCode = json['race_group_code'];
    courseUid = json['course_uid'];
    courseTypeCode = json['course_type_code'];
    courseName = json['course_name'];
    courseStyleName = json['course_style_name'];
    trainerShortName = json['trainer_short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['race_date'] = this.raceDate;
    data['rp_abbrev_3'] = this.rpAbbrev3;
    data['country'] = this.country;
    data['distance_yard'] = this.distanceYard;
    data['distance_furlong_rounded'] = this.distanceFurlongRounded;
    data['race_instance_uid'] = this.raceInstanceUid;
    data['race_instance_title'] = this.raceInstanceTitle;
    data['prize_sterling'] = this.prizeSterling;
    data['prize_euro'] = this.prizeEuro;
    data['days_diff'] = this.daysDiff;
    data['race_outcome_code'] = this.raceOutcomeCode;
    data['race_outcome_position'] = this.raceOutcomePosition;
    data['disq_desc'] = this.disqDesc;
    data['horse_style_name'] = this.horseStyleName;
    data['horse_uid'] = this.horseUid;
    data['trainer_ptp_type_code'] = this.trainerPtpTypeCode;
    data['trainer_style_name'] = this.trainerStyleName;
    data['trainer_uid'] = this.trainerUid;
    data['race_type_code'] = this.raceTypeCode;
    data['race_group_desc'] = this.raceGroupDesc;
    data['race_group_code'] = this.raceGroupCode;
    data['course_uid'] = this.courseUid;
    data['course_type_code'] = this.courseTypeCode;
    data['course_name'] = this.courseName;
    data['course_style_name'] = this.courseStyleName;
    data['trainer_short_name'] = this.trainerShortName;
    return data;
  }
}
