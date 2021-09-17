import 'dart:convert';

import 'package:flutter/cupertino.dart';

class HorseFormModelFormRaceTacticsPredicted {
  String? runnerAttribType;
  String? runnerAttribDescription;

  HorseFormModelFormRaceTacticsPredicted({
    this.runnerAttribType,
    this.runnerAttribDescription,
  });
  HorseFormModelFormRaceTacticsPredicted.fromJson(Map<String, dynamic> json) {
    runnerAttribType = json["runner_attrib_type"]?.toString();
    runnerAttribDescription = json["runner_attrib_description"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["runner_attrib_type"] = runnerAttribType;
    data["runner_attrib_description"] = runnerAttribDescription;
    return data;
  }
}

class HorseFormModelFormRaceTacticsActual {
  String? runnerAttribType;
  String? runnerAttribDescription;

  HorseFormModelFormRaceTacticsActual({
    this.runnerAttribType,
    this.runnerAttribDescription,
  });
  HorseFormModelFormRaceTacticsActual.fromJson(Map<String, dynamic> json) {
    runnerAttribType = json["runner_attrib_type"]?.toString();
    runnerAttribDescription = json["runner_attrib_description"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["runner_attrib_type"] = runnerAttribType;
    data["runner_attrib_description"] = runnerAttribDescription;
    return data;
  }
}

class HorseFormModelFormRaceTactics {
  HorseFormModelFormRaceTacticsActual? actual;
  HorseFormModelFormRaceTacticsPredicted? predicted;

  HorseFormModelFormRaceTactics({
    this.actual,
    this.predicted,
  });
  HorseFormModelFormRaceTactics.fromJson(Map<String, dynamic> json) {
    actual = (json["actual"] != null)
        ? HorseFormModelFormRaceTacticsActual.fromJson(json["actual"])
        : null;
    predicted = (json["predicted"] != null)
        ? HorseFormModelFormRaceTacticsPredicted.fromJson(json["predicted"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (actual != null) {
      data["actual"] = actual!.toJson();
    }
    if (predicted != null) {
      data["predicted"] = predicted!.toJson();
    }
    return data;
  }
}

class HorseFormModelFormOtherHorse {
  String? styleName;
  int? horseUid;
  int? weightCarriedLbs;

  HorseFormModelFormOtherHorse({
    this.styleName,
    this.horseUid,
    this.weightCarriedLbs,
  });
  HorseFormModelFormOtherHorse.fromJson(Map<String, dynamic> json) {
    styleName = json["style_name"]?.toString();
    horseUid = json["horse_uid"]?.toInt();
    weightCarriedLbs = json["weight_carried_lbs"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["style_name"] = styleName;
    data["horse_uid"] = horseUid;
    data["weight_carried_lbs"] = weightCarriedLbs;
    return data;
  }
}

class HorseFormModelFormVideoDetail {
  int? ptvVideoId;
  String? videoProvider;
  int? completeRaceUid;
  int? completeRaceStart;
  int? completeRaceEnd;
  int? finishRaceUid;
  int? finishRaceStart;
  int? finishRaceEnd;

  HorseFormModelFormVideoDetail({
    this.ptvVideoId,
    this.videoProvider,
    this.completeRaceUid,
    this.completeRaceStart,
    this.completeRaceEnd,
    this.finishRaceUid,
    this.finishRaceStart,
    this.finishRaceEnd,
  });
  HorseFormModelFormVideoDetail.fromJson(Map<String, dynamic> json) {
    ptvVideoId = json["ptv_video_id"]?.toInt();
    videoProvider = json["video_provider"]?.toString();
    completeRaceUid = json["complete_race_uid"]?.toInt();
    completeRaceStart = json["complete_race_start"]?.toInt();
    completeRaceEnd = json["complete_race_end"]?.toInt();
    finishRaceUid = json["finish_race_uid"]?.toInt();
    finishRaceStart = json["finish_race_start"]?.toInt();
    finishRaceEnd = json["finish_race_end"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["ptv_video_id"] = ptvVideoId;
    data["video_provider"] = videoProvider;
    data["complete_race_uid"] = completeRaceUid;
    data["complete_race_start"] = completeRaceStart;
    data["complete_race_end"] = completeRaceEnd;
    data["finish_race_uid"] = finishRaceUid;
    data["finish_race_start"] = finishRaceStart;
    data["finish_race_end"] = finishRaceEnd;
    return data;
  }
}

class HorseFormModelForm {
  int? index;
  int? raceInstanceUid;
  int? raceGroupUid;
  String? raceDatetime;
  String? localMeetingRaceDatetime;
  int? courseUid;
  String? courseTypeCode;
  String? courseName;
  String? courseStyleName;
  String? courseRegion;
  String? countryCode;
  String? raceInstanceTitle;
  String? raceTypeCode;
  String? courseRpAbbrev_3;
  String? courseRpAbbrev_4;
  String? courseCode;
  String? courseComments;
  String? goingTypeServicesDesc;
  int? prizeSterling;
  int? prizeEuro;
  int? distanceYard;
  int? distanceFurlong;
  String? raceClass;
  String? agesAllowedDesc;
  String? rpBettingMovements;
  String? raceGroupCode;
  String? raceGroupDesc;
  int? weightCarriedLbs;
  int? weightAllowanceLbs;
  int? noOfRunners;
  String? rpCloseUpComment;
  String? horseHeadGear;
  bool? firstTimeHeadgear;
  String? oddsDesc;
  double? oddsValue;
  String? jockeyStyleName;
  String? jockeyShortName;
  int? jockeyUid;
  String? jockeyPtpTypeCode;
  int? officialRatingRanOff;
  int? rpTopspeed;
  int? rpPostmark;
  List<HorseFormModelFormVideoDetail?>? videoDetail;
  String? raceDescription;
  String? distanceToWinner;
  String? winningDistance;
  String? goingTypeCode;
  String? raceOutcomeCode;
  HorseFormModelFormOtherHorse? otherHorse;
  String? disqualificationUid;
  String? disqualificationDesc;
  String? rpStraightRoundJubileeDesc;
  int? draw;
  HorseFormModelFormRaceTactics? raceTactics;

  HorseFormModelForm({
    this.index,
    this.raceInstanceUid,
    this.raceGroupUid,
    this.raceDatetime,
    this.localMeetingRaceDatetime,
    this.courseUid,
    this.courseTypeCode,
    this.courseName,
    this.courseStyleName,
    this.courseRegion,
    this.countryCode,
    this.raceInstanceTitle,
    this.raceTypeCode,
    this.courseRpAbbrev_3,
    this.courseRpAbbrev_4,
    this.courseCode,
    this.courseComments,
    this.goingTypeServicesDesc,
    this.prizeSterling,
    this.prizeEuro,
    this.distanceYard,
    this.distanceFurlong,
    this.raceClass,
    this.agesAllowedDesc,
    this.rpBettingMovements,
    this.raceGroupCode,
    this.raceGroupDesc,
    this.weightCarriedLbs,
    this.weightAllowanceLbs,
    this.noOfRunners,
    this.rpCloseUpComment,
    this.horseHeadGear,
    this.firstTimeHeadgear,
    this.oddsDesc,
    this.oddsValue,
    this.jockeyStyleName,
    this.jockeyShortName,
    this.jockeyUid,
    this.jockeyPtpTypeCode,
    this.officialRatingRanOff,
    this.rpTopspeed,
    this.rpPostmark,
    this.videoDetail,
    this.raceDescription,
    this.distanceToWinner,
    this.winningDistance,
    this.goingTypeCode,
    this.raceOutcomeCode,
    this.otherHorse,
    this.disqualificationUid,
    this.disqualificationDesc,
    this.rpStraightRoundJubileeDesc,
    this.draw,
    this.raceTactics,
  });
  HorseFormModelForm.fromJson(Map<String, dynamic> json) {
    print("Second json =====>$json");
    raceInstanceUid = json["race_instance_uid"]?.toInt();
    raceGroupUid = json["race_group_uid"]?.toInt();
    raceDatetime = json["race_datetime"]?.toString();
    localMeetingRaceDatetime = json["local_meeting_race_datetime"]?.toString();
    courseUid = json["course_uid"]?.toInt();
    courseTypeCode = json["course_type_code"]?.toString();
    courseName = json["course_name"]?.toString();
    courseStyleName = json["course_style_name"]?.toString();
    courseRegion = json["course_region"]?.toString();
    countryCode = json["country_code"]?.toString();
    raceInstanceTitle = json["race_instance_title"]?.toString();
    raceTypeCode = json["race_type_code"]?.toString();
    courseRpAbbrev_3 = json["course_rp_abbrev_3"]?.toString();
    courseRpAbbrev_4 = json["course_rp_abbrev_4"]?.toString();
    courseCode = json["course_code"]?.toString();
    courseComments = json["course_comments"]?.toString();
    goingTypeServicesDesc = json["going_type_services_desc"]?.toString();
    prizeSterling = json["prize_sterling"]?.toInt();
    prizeEuro = json["prize_euro"]?.toInt();
    distanceYard = json["distance_yard"]?.toInt();
    distanceFurlong = json["distance_furlong"]?.toInt();
    raceClass = json["race_class"]?.toString();
    agesAllowedDesc = json["ages_allowed_desc"]?.toString();
    rpBettingMovements = json["rp_betting_movements"]?.toString();
    raceGroupCode = json["race_group_code"]?.toString();
    raceGroupDesc = json["race_group_desc"]?.toString();
    weightCarriedLbs = json["weight_carried_lbs"]?.toInt();
    weightAllowanceLbs = json["weight_allowance_lbs"]?.toInt();
    noOfRunners = json["no_of_runners"]?.toInt();
    rpCloseUpComment = json["rp_close_up_comment"]?.toString();
    horseHeadGear = json["horse_head_gear"]?.toString();
    firstTimeHeadgear = json["first_time_headgear"];
    oddsDesc = json["odds_desc"]?.toString();
    oddsValue = json["odds_value"]?.toDouble();
    jockeyStyleName = json["jockey_style_name"]?.toString();
    jockeyShortName = json["jockey_short_name"]?.toString();
    jockeyUid = json["jockey_uid"]?.toInt();
    jockeyPtpTypeCode = json["jockey_ptp_type_code"]?.toString();
    officialRatingRanOff = json["official_rating_ran_off"]?.toInt();
    rpTopspeed = json["rp_topspeed"]?.toInt();
    rpPostmark = json["rp_postmark"]?.toInt();
    if (json["video_detail"] != null) {
      final v = json["video_detail"];
      final arr0 = <HorseFormModelFormVideoDetail>[];
      v.forEach((v) {
        arr0.add(HorseFormModelFormVideoDetail.fromJson(v));
      });
      videoDetail = arr0;
    }
    raceDescription = json["race_description"]?.toString();
    distanceToWinner = json["distance_to_winner"]?.toString();
    winningDistance = json["winning_distance"]?.toString();
    goingTypeCode = json["going_type_code"]?.toString();
    raceOutcomeCode = json["race_outcome_code"]?.toString();
    otherHorse = (json["other_horse"] != null)
        ? HorseFormModelFormOtherHorse.fromJson(json["other_horse"])
        : null;
    disqualificationUid = json["disqualification_uid"]?.toString();
    disqualificationDesc = json["disqualification_desc"]?.toString();
    rpStraightRoundJubileeDesc =
        json["rp_straight_round_jubilee_desc"]?.toString();
    draw = json["draw"]?.toInt();
    raceTactics = (json["race_tactics"] != null)
        ? HorseFormModelFormRaceTactics.fromJson(json["race_tactics"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["race_instance_uid"] = raceInstanceUid;
    data["race_group_uid"] = raceGroupUid;
    data["race_datetime"] = raceDatetime;
    data["local_meeting_race_datetime"] = localMeetingRaceDatetime;
    data["course_uid"] = courseUid;
    data["course_type_code"] = courseTypeCode;
    data["course_name"] = courseName;
    data["course_style_name"] = courseStyleName;
    data["course_region"] = courseRegion;
    data["country_code"] = countryCode;
    data["race_instance_title"] = raceInstanceTitle;
    data["race_type_code"] = raceTypeCode;
    data["course_rp_abbrev_3"] = courseRpAbbrev_3;
    data["course_rp_abbrev_4"] = courseRpAbbrev_4;
    data["course_code"] = courseCode;
    data["course_comments"] = courseComments;
    data["going_type_services_desc"] = goingTypeServicesDesc;
    data["prize_sterling"] = prizeSterling;
    data["prize_euro"] = prizeEuro;
    data["distance_yard"] = distanceYard;
    data["distance_furlong"] = distanceFurlong;
    data["race_class"] = raceClass;
    data["ages_allowed_desc"] = agesAllowedDesc;
    data["rp_betting_movements"] = rpBettingMovements;
    data["race_group_code"] = raceGroupCode;
    data["race_group_desc"] = raceGroupDesc;
    data["weight_carried_lbs"] = weightCarriedLbs;
    data["weight_allowance_lbs"] = weightAllowanceLbs;
    data["no_of_runners"] = noOfRunners;
    data["rp_close_up_comment"] = rpCloseUpComment;
    data["horse_head_gear"] = horseHeadGear;
    data["first_time_headgear"] = firstTimeHeadgear;
    data["odds_desc"] = oddsDesc;
    data["odds_value"] = oddsValue;
    data["jockey_style_name"] = jockeyStyleName;
    data["jockey_short_name"] = jockeyShortName;
    data["jockey_uid"] = jockeyUid;
    data["jockey_ptp_type_code"] = jockeyPtpTypeCode;
    data["official_rating_ran_off"] = officialRatingRanOff;
    data["rp_topspeed"] = rpTopspeed;
    data["rp_postmark"] = rpPostmark;

    if (videoDetail != null) {
      final v = videoDetail;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["video_detail"] = arr0;
    }
    data["race_description"] = raceDescription;
    data["distance_to_winner"] = distanceToWinner;
    data["winning_distance"] = winningDistance;
    data["going_type_code"] = goingTypeCode;
    data["race_outcome_code"] = raceOutcomeCode;
    if (otherHorse != null) {
      data["other_horse"] = otherHorse!.toJson();
    }
    data["disqualification_uid"] = disqualificationUid;
    data["disqualification_desc"] = disqualificationDesc;
    data["rp_straight_round_jubilee_desc"] = rpStraightRoundJubileeDesc;
    data["draw"] = draw;
    if (raceTactics != null) {
      data["race_tactics"] = raceTactics!.toJson();
    }
    return data;
  }
}

class HorseFormModel {
  List<HorseFormModelForm?>? form;
  int? status;

  HorseFormModel({
    this.form,
    this.status,
  });
  HorseFormModel.fromJson(Map<String, dynamic> json) {
    int i = 0;
    if (json["form"] != null) {
      Map<String,dynamic> v = json["form"];
      List<HorseFormModelForm?> arr0 = [];
      v.forEach((key,value) {
        arr0.add(HorseFormModelForm.fromJson(value));
        arr0[i]!.index = i;
        i = i + 1;
      });
      form = arr0;
    } else {
    
    }
    //status = json["status"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (form != null) {
      final v = form;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["form"] = arr0;
    }
    // data["status"] = status;
    return data;
  }
}

class HorseFormProvider extends ChangeNotifier {
  HorseFormModel? formModel;
  addFormData(HorseFormModel data) {
    formModel = data;
    notifyListeners();
  }
}
