class OwnerLast14Days {
  Data? data;
  int? status;

  OwnerLast14Days({this.data, this.status});

  OwnerLast14Days.fromJson(Map<String, dynamic> json) {
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
  List<Last14Days>? last14Days;

  Data({this.last14Days});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['last_14_days'] != null) {
      last14Days = [];
      json['last_14_days'].forEach((v) {
        last14Days!.add(new Last14Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.last14Days != null) {
      data['last_14_days'] = this.last14Days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Last14Days {
  int index = 0;
  int? raceInstanceUid;
  String? raceDatetime;
  int? courseUid;
  String? courseTypeCode;
  String? raceInstanceTitle;
  String? raceTypeCode;
  String? courseRpAbbrev3;
  String? courseRpAbbrev4;
  String? courseCode;
  String? goingTypeServicesDesc;
  String? raceDescription;
  double? prizeSterling;
  int? prizeEuro;
  int? noOfRunners;
  int? distanceYard;
  String? distanceToWinner;
  int? horseUid;
  String? horseStyleName;
  int? weightCarriedLbs;
  String? rpBettingMovements;
  String? rpCloseUpComment;
  String? horseHeadGear;
  String? oddsDesc;
  int? trainerUid;
  String? trainerStyleName;
  String? trainerPtpTypeCode;
  int? rpPostmark;
  int? rpPrePostmark;
  //List<VideoDetail>? videoDetail;
  String? raceClass;
  String? rpAgesAllowedDesc;
  String? raceGroupCode;
  String? raceGroupDesc;
  double? distanceFurlong;
  String? winningDistance;
  String? courseName;
  String? courseStyleName;
  int? rpPostmarkDifference;
  bool? firstTimeHeadgear;
  String? raceOutcomeCode;
  String? trainerShortName;
  double? oddsValue;

  Last14Days(
      {this.raceInstanceUid,
      this.raceDatetime,
      this.courseUid,
      this.courseTypeCode,
      this.raceInstanceTitle,
      this.raceTypeCode,
      this.courseRpAbbrev3,
      this.courseRpAbbrev4,
      this.courseCode,
      this.goingTypeServicesDesc,
      this.raceDescription,
      this.prizeSterling,
      this.prizeEuro,
      this.noOfRunners,
      this.distanceYard,
      this.distanceToWinner,
      this.horseUid,
      this.horseStyleName,
      this.weightCarriedLbs,
      this.rpBettingMovements,
      this.rpCloseUpComment,
      this.horseHeadGear,
      this.oddsDesc,
      this.trainerUid,
      this.trainerStyleName,
      this.trainerPtpTypeCode,
      this.rpPostmark,
      this.rpPrePostmark,
      //this.videoDetail,
      this.raceClass,
      this.rpAgesAllowedDesc,
      this.raceGroupCode,
      this.raceGroupDesc,
      this.distanceFurlong,
      this.winningDistance,
      this.courseName,
      this.courseStyleName,
      this.rpPostmarkDifference,
      this.firstTimeHeadgear,
      this.raceOutcomeCode,
      this.trainerShortName,
      this.oddsValue});

  Last14Days.fromJson(Map<String, dynamic> json) {
    raceInstanceUid = json['race_instance_uid'];
    raceDatetime = json['race_datetime'];
    courseUid = json['course_uid'];
    courseTypeCode = json['course_type_code'];
    raceInstanceTitle = json['race_instance_title'];
    raceTypeCode = json['race_type_code'];
    courseRpAbbrev3 = json['course_rp_abbrev_3'];
    courseRpAbbrev4 = json['course_rp_abbrev_4'];
    courseCode = json['course_code'];
    goingTypeServicesDesc = json['going_type_services_desc'];
    raceDescription = json['race_description'];
    prizeSterling = double.parse(json['prize_sterling'].toString());
    prizeEuro = json['prize_euro'];
    noOfRunners = json['no_of_runners'];
    distanceYard = json['distance_yard'];
    distanceToWinner = json['distance_to_winner'];
    horseUid = json['horse_uid'];
    horseStyleName = json['horse_style_name'];
    weightCarriedLbs = json['weight_carried_lbs'];
    rpBettingMovements = json['rp_betting_movements'];
    rpCloseUpComment = json['rp_close_up_comment'];
    horseHeadGear = json['horse_head_gear'];
    oddsDesc = json['odds_desc'];
    trainerUid = json['trainer_uid'];
    trainerStyleName = json['trainer_style_name'];
    trainerPtpTypeCode = json['trainer_ptp_type_code'];
    rpPostmark = json['rp_postmark'];
    rpPrePostmark = json['rp_pre_postmark'];
    // if (json['video_detail'] != null) {
    //   videoDetail = new List<VideoDetail>();
    //   json['video_detail'].forEach((v) {
    //     videoDetail.add(new VideoDetail.fromJson(v));
    //   });
    // }
    raceClass = json['race_class'];
    rpAgesAllowedDesc = json['rp_ages_allowed_desc'];
    raceGroupCode = json['race_group_code'];
    raceGroupDesc = json['race_group_desc'];
    distanceFurlong = double.parse(json['distance_furlong'].toString());
    winningDistance = json['winning_distance'];
    courseName = json['course_name'];
    courseStyleName = json['course_style_name'];
    rpPostmarkDifference = json['rp_postmark_difference'];
    firstTimeHeadgear = json['first_time_headgear'];
    raceOutcomeCode = json['race_outcome_code'];
    trainerShortName = json['trainer_short_name'];
    oddsValue = double.parse(json['odds_value'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['race_instance_uid'] = this.raceInstanceUid;
    data['race_datetime'] = this.raceDatetime;
    data['course_uid'] = this.courseUid;
    data['course_type_code'] = this.courseTypeCode;
    data['race_instance_title'] = this.raceInstanceTitle;
    data['race_type_code'] = this.raceTypeCode;
    data['course_rp_abbrev_3'] = this.courseRpAbbrev3;
    data['course_rp_abbrev_4'] = this.courseRpAbbrev4;
    data['course_code'] = this.courseCode;
    data['going_type_services_desc'] = this.goingTypeServicesDesc;
    data['race_description'] = this.raceDescription;
    data['prize_sterling'] = this.prizeSterling;
    data['prize_euro'] = this.prizeEuro;
    data['no_of_runners'] = this.noOfRunners;
    data['distance_yard'] = this.distanceYard;
    data['distance_to_winner'] = this.distanceToWinner;
    data['horse_uid'] = this.horseUid;
    data['horse_style_name'] = this.horseStyleName;
    data['weight_carried_lbs'] = this.weightCarriedLbs;
    data['rp_betting_movements'] = this.rpBettingMovements;
    data['rp_close_up_comment'] = this.rpCloseUpComment;
    data['horse_head_gear'] = this.horseHeadGear;
    data['odds_desc'] = this.oddsDesc;
    data['trainer_uid'] = this.trainerUid;
    data['trainer_style_name'] = this.trainerStyleName;
    data['trainer_ptp_type_code'] = this.trainerPtpTypeCode;
    data['rp_postmark'] = this.rpPostmark;
    data['rp_pre_postmark'] = this.rpPrePostmark;
    // if (this.videoDetail != null) {
    //   data['video_detail'] = this.videoDetail.map((v) => v.toJson()).toList();
    // }
    // data['race_class'] = this.raceClass;
    data['rp_ages_allowed_desc'] = this.rpAgesAllowedDesc;
    data['race_group_code'] = this.raceGroupCode;
    data['race_group_desc'] = this.raceGroupDesc;
    data['distance_furlong'] = this.distanceFurlong;
    data['winning_distance'] = this.winningDistance;
    data['course_name'] = this.courseName;
    data['course_style_name'] = this.courseStyleName;
    data['rp_postmark_difference'] = this.rpPostmarkDifference;
    data['first_time_headgear'] = this.firstTimeHeadgear;
    data['race_outcome_code'] = this.raceOutcomeCode;
    data['trainer_short_name'] = this.trainerShortName;
    data['odds_value'] = this.oddsValue;
    return data;
  }
}

// class VideoDetail {
//   int? ptvVideoId;
//   String? videoProvider;
//   int completeRaceUid;
//   int completeRaceStart;
//   int completeRaceEnd;
//   int finishRaceUid;
//   int finishRaceStart;
//   int finishRaceEnd;
//
//   VideoDetail(
//       {this.ptvVideoId,
//         this.videoProvider,
//         this.completeRaceUid,
//         this.completeRaceStart,
//         this.completeRaceEnd,
//         this.finishRaceUid,
//         this.finishRaceStart,
//         this.finishRaceEnd});
//
//   VideoDetail.fromJson(Map<String, dynamic> json) {
//     ptvVideoId = json['ptv_video_id'];
//     videoProvider = json['video_provider'];
//     completeRaceUid = json['complete_race_uid'];
//     completeRaceStart = json['complete_race_start'];
//     completeRaceEnd = json['complete_race_end'];
//     finishRaceUid = json['finish_race_uid'];
//     finishRaceStart = json['finish_race_start'];
//     finishRaceEnd = json['finish_race_end'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ptv_video_id'] = this.ptvVideoId;
//     data['video_provider'] = this.videoProvider;
//     data['complete_race_uid'] = this.completeRaceUid;
//     data['complete_race_start'] = this.completeRaceStart;
//     data['complete_race_end'] = this.completeRaceEnd;
//     data['finish_race_uid'] = this.finishRaceUid;
//     data['finish_race_start'] = this.finishRaceStart;
//     data['finish_race_end'] = this.finishRaceEnd;
//     return data;
//   }
// }
