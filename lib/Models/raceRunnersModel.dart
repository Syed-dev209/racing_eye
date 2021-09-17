class RaceRunnersModelDataRunners3785503JockeyLast_14Days {
  int? wins;
  int? runs;
  int? percent;

  RaceRunnersModelDataRunners3785503JockeyLast_14Days({
    this.wins,
    this.runs,
    this.percent,
  });
  RaceRunnersModelDataRunners3785503JockeyLast_14Days.fromJson(
      Map<String, dynamic> json) {
    wins = json["wins"]?.toInt();
    runs = json["runs"]?.toInt();
    percent = json["percent"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["wins"] = wins;
    data["runs"] = runs;
    data["percent"] = percent;
    return data;
  }
}

class RaceRunnersModelDataRunnersModel {
  int? startNumber;
  int? draw;
  String? raceTypeCode;
  String? raceStatusCode;
  int? distanceYard;
  int? distanceFurlongRounded;
  String? trackCode;
  int? courseUid;
  String? straightRoundJubileeCode;
  int? ownerUid;
  String? ownerName;
  int? breederUid;
  String? breederName;
  int? eliminatorNo;
  int? horseUid;
  String? horseName;
  int? raceInstanceUid;
  String? raceDatetime;
  String? rpHorseHeadGearCode;
  bool? firstTime;
  bool? windSurgeryFirstTime;
  bool? goingWinner;
  bool? windSurgerySecondTime;
  bool? jockeyFirstTime;
  String? extraWeightLbs;
  int? horseAge;
  String? horseDateOfBirth;
  int? weightCarriedLbs;
  String? officialRating;
  int? officialRatingToday;
  bool? handicapFirstTime;
  int? jockeyUid;
  String? jockeyName;
  String? shortJockeyName;
  String? weightAllowanceLbs;
  int? trainerId;
  String? trainerStylename;
  String? shortTrainerName;
  int? trainerRtf;
  String? trainerCountryCode;
  String? rpTopspeed;
  String? rpPostmark;
  bool? rpPostmarkImprover;
  int? unadjustedRpPostmark;
  String? rpOwnerChoice;
  bool? nonRunner;
  bool? irishReserve;
  String? allowance;
  String? extraWeight;
  String? horseColourCode;
  String? horseSexCode;
  int? sireId;
  String? sireName;
  String? sireCountry;
  String? firstSeasonSireId;
  int? damId;
  String? damName;
  String? damCountry;
  int? damsireId;
  String? damsireName;
  String? damsireCountry;
  String? spotlight;
  String? diomed;
  String? figures;
  String? figuresCalculated;
  String? silkImagePng;
  int? daysSinceLastRun;
  String? daysSinceLastRunFlat;
  String? daysSinceLastRunJumps;
  String? daysSinceLastRunPtp;
  String? newTrainerRacesCount;
  String? selectionCnt;
  bool? tenToFollowHorse;
  bool? plus10Horse;
  bool? yearlingBonusHorse;
  bool? beatenFavourite;
  double? forecastOddsValue;
  String? forecastOddsDesc;
  String? forecastOddsStyle;
  int? courseAndDistanceWins;
  int? courseWins;
  int? distanceWins;
  String? lhWeightCarriedLbs;
  String? outOfHandicap;
  String? futureRatingDifference;
  String? runningConditions;
  String? countryOriginCode;
  String? silkImagePath;
  bool? geldingFirstTime;
  int? wfaAdjustment;
  String? ownerGroupUid;
  String? officialRatingHorse;
  String? slowGroundFlatWins;
  String? slowGroundJumpsWins;
  String? fastGroundWins;
  RaceRunnersModelDataRunners3785503JockeyLast_14Days? jockeyLast_14Days;

  RaceRunnersModelDataRunnersModel({
    this.startNumber,
    this.draw,
    this.raceTypeCode,
    this.raceStatusCode,
    this.distanceYard,
    this.distanceFurlongRounded,
    this.trackCode,
    this.courseUid,
    this.straightRoundJubileeCode,
    this.ownerUid,
    this.ownerName,
    this.breederUid,
    this.breederName,
    this.eliminatorNo,
    this.horseUid,
    this.horseName,
    this.raceInstanceUid,
    this.raceDatetime,
    this.rpHorseHeadGearCode,
    this.firstTime,
    this.windSurgeryFirstTime,
    this.goingWinner,
    this.windSurgerySecondTime,
    this.jockeyFirstTime,
    this.extraWeightLbs,
    this.horseAge,
    this.horseDateOfBirth,
    this.weightCarriedLbs,
    this.officialRating,
    this.officialRatingToday,
    this.handicapFirstTime,
    this.jockeyUid,
    this.jockeyName,
    this.shortJockeyName,
    this.weightAllowanceLbs,
    this.trainerId,
    this.trainerStylename,
    this.shortTrainerName,
    this.trainerRtf,
    this.trainerCountryCode,
    this.rpTopspeed,
    this.rpPostmark,
    this.rpPostmarkImprover,
    this.unadjustedRpPostmark,
    this.rpOwnerChoice,
    this.nonRunner,
    this.irishReserve,
    this.allowance,
    this.extraWeight,
    this.horseColourCode,
    this.horseSexCode,
    this.sireId,
    this.sireName,
    this.sireCountry,
    this.firstSeasonSireId,
    this.damId,
    this.damName,
    this.damCountry,
    this.damsireId,
    this.damsireName,
    this.damsireCountry,
    this.spotlight,
    this.diomed,
    this.figures,
    this.figuresCalculated,
    this.silkImagePng,
    this.daysSinceLastRun,
    this.daysSinceLastRunFlat,
    this.daysSinceLastRunJumps,
    this.daysSinceLastRunPtp,
    this.newTrainerRacesCount,
    this.selectionCnt,
    this.tenToFollowHorse,
    this.plus10Horse,
    this.yearlingBonusHorse,
    this.beatenFavourite,
    this.forecastOddsValue,
    this.forecastOddsDesc,
    this.forecastOddsStyle,
    this.courseAndDistanceWins,
    this.courseWins,
    this.distanceWins,
    this.lhWeightCarriedLbs,
    this.outOfHandicap,
    this.futureRatingDifference,
    this.runningConditions,
    this.countryOriginCode,
    this.silkImagePath,
    this.geldingFirstTime,
    this.wfaAdjustment,
    this.ownerGroupUid,
    this.officialRatingHorse,
    this.slowGroundFlatWins,
    this.slowGroundJumpsWins,
    this.fastGroundWins,
    this.jockeyLast_14Days,
  });
  RaceRunnersModelDataRunnersModel.fromJson(Map<String, dynamic> json) {
    startNumber = json["start_number"]?.toInt();
    draw = json["draw"]?.toInt();
    raceTypeCode = json["race_type_code"]?.toString();
    raceStatusCode = json["race_status_code"]?.toString();
    distanceYard = json["distance_yard"]?.toInt();
    distanceFurlongRounded = json["distance_furlong_rounded"]?.toInt();
    trackCode = json["track_code"]?.toString();
    courseUid = json["course_uid"]?.toInt();
    straightRoundJubileeCode = json["straight_round_jubilee_code"]?.toString();
    ownerUid = json["owner_uid"]?.toInt();
    ownerName = json["owner_name"]?.toString();
    breederUid = json["breeder_uid"]?.toInt();
    breederName = json["breeder_name"]?.toString();
    eliminatorNo = json["eliminator_no"]?.toInt();
    horseUid = json["horse_uid"]?.toInt();
    horseName = json["horse_name"]?.toString();
    raceInstanceUid = json["race_instance_uid"]?.toInt();
    raceDatetime = json["race_datetime"]?.toString();
    rpHorseHeadGearCode = json["rp_horse_head_gear_code"]?.toString();
    firstTime = json["first_time"];
    windSurgeryFirstTime = json["wind_surgery_first_time"];
    goingWinner = json["going_winner"];
    windSurgerySecondTime = json["wind_surgery_second_time"];
    jockeyFirstTime = json["jockey_first_time"];
    extraWeightLbs = json["extra_weight_lbs"]?.toString();
    horseAge = json["horse_age"]?.toInt();
    horseDateOfBirth = json["horse_date_of_birth"]?.toString();
    weightCarriedLbs = json["weight_carried_lbs"]?.toInt();
    officialRating = json["official_rating"]?.toString();
    officialRatingToday = json["official_rating_today"]?.toInt();
    handicapFirstTime = json["handicap_first_time"];
    jockeyUid = json["jockey_uid"]?.toInt();
    jockeyName = json["jockey_name"]?.toString();
    shortJockeyName = json["short_jockey_name"]?.toString();
    weightAllowanceLbs = json["weight_allowance_lbs"]?.toString();
    trainerId = json["trainer_id"]?.toInt();
    trainerStylename = json["trainer_stylename"]?.toString();
    shortTrainerName = json["short_trainer_name"]?.toString();
    trainerRtf = json["trainer_rtf"]?.toInt();
    trainerCountryCode = json["trainer_country_code"]?.toString();
    rpTopspeed = json["rp_topspeed"]?.toString();
    rpPostmark = json["rp_postmark"]?.toString();
    rpPostmarkImprover = json["rp_postmark_improver"];
    unadjustedRpPostmark = json["unadjusted_rp_postmark"]?.toInt();
    rpOwnerChoice = json["rp_owner_choice"]?.toString();
    nonRunner = json["non_runner"];
    irishReserve = json["irish_reserve"];
    allowance = json["allowance"]?.toString();
    extraWeight = json["extra_weight"]?.toString();
    horseColourCode = json["horse_colour_code"]?.toString();
    horseSexCode = json["horse_sex_code"]?.toString();
    sireId = json["sire_id"]?.toInt();
    sireName = json["sire_name"]?.toString();
    sireCountry = json["sire_country"]?.toString();
    firstSeasonSireId = json["first_season_sire_id"]?.toString();
    damId = json["dam_id"]?.toInt();
    damName = json["dam_name"]?.toString();
    damCountry = json["dam_country"]?.toString();
    damsireId = json["damsire_id"]?.toInt();
    damsireName = json["damsire_name"]?.toString();
    damsireCountry = json["damsire_country"]?.toString();
    spotlight = json["spotlight"]?.toString();
    diomed = json["diomed"]?.toString();
    figures = json["figures"]?.toString();
    figuresCalculated = json["figures_calculated"]?.toString();
    silkImagePng = json["silk_image_png"]?.toString();
    daysSinceLastRun = json["days_since_last_run"]?.toInt();
    daysSinceLastRunFlat = json["days_since_last_run_flat"]?.toString();
    daysSinceLastRunJumps = json["days_since_last_run_jumps"]?.toString();
    daysSinceLastRunPtp = json["days_since_last_run_ptp"]?.toString();
    newTrainerRacesCount = json["new_trainer_races_count"]?.toString();
    selectionCnt = json["selection_cnt"]?.toString();
    tenToFollowHorse = json["ten_to_follow_horse"];
    plus10Horse = json["plus10_horse"];
    yearlingBonusHorse = json["yearling_bonus_horse"];
    beatenFavourite = json["beaten_favourite"];
    forecastOddsValue = json["forecast_odds_value"]?.toDouble();
    forecastOddsDesc = json["forecast_odds_desc"]?.toString();
    forecastOddsStyle = json["forecast_odds_style"]?.toString();
    courseAndDistanceWins = json["course_and_distance_wins"]?.toInt();
    courseWins = json["course_wins"]?.toInt();
    distanceWins = json["distance_wins"]?.toInt();
    lhWeightCarriedLbs = json["lh_weight_carried_lbs"]?.toString();
    outOfHandicap = json["out_of_handicap"]?.toString();
    futureRatingDifference = json["future_rating_difference"]?.toString();
    runningConditions = json["running_conditions"]?.toString();
    countryOriginCode = json["country_origin_code"]?.toString();
    silkImagePath = json["silk_image_path"]?.toString();
    geldingFirstTime = json["gelding_first_time"];
    wfaAdjustment = json["wfa_adjustment"]?.toInt();
    ownerGroupUid = json["owner_group_uid"]?.toString();
    officialRatingHorse = json["official_rating_horse"]?.toString();
    slowGroundFlatWins = json["slow_ground_flat_wins"]?.toString();
    slowGroundJumpsWins = json["slow_ground_jumps_wins"]?.toString();
    fastGroundWins = json["fast_ground_wins"]?.toString();
    jockeyLast_14Days = (json["jockey_last_14_days"] != null)
        ? RaceRunnersModelDataRunners3785503JockeyLast_14Days.fromJson(
            json["jockey_last_14_days"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["start_number"] = startNumber;
    data["draw"] = draw;
    data["race_type_code"] = raceTypeCode;
    data["race_status_code"] = raceStatusCode;
    data["distance_yard"] = distanceYard;
    data["distance_furlong_rounded"] = distanceFurlongRounded;
    data["track_code"] = trackCode;
    data["course_uid"] = courseUid;
    data["straight_round_jubilee_code"] = straightRoundJubileeCode;
    data["owner_uid"] = ownerUid;
    data["owner_name"] = ownerName;
    data["breeder_uid"] = breederUid;
    data["breeder_name"] = breederName;
    data["eliminator_no"] = eliminatorNo;
    data["horse_uid"] = horseUid;
    data["horse_name"] = horseName;
    data["race_instance_uid"] = raceInstanceUid;
    data["race_datetime"] = raceDatetime;
    data["rp_horse_head_gear_code"] = rpHorseHeadGearCode;
    data["first_time"] = firstTime;
    data["wind_surgery_first_time"] = windSurgeryFirstTime;
    data["going_winner"] = goingWinner;
    data["wind_surgery_second_time"] = windSurgerySecondTime;
    data["jockey_first_time"] = jockeyFirstTime;
    data["extra_weight_lbs"] = extraWeightLbs;
    data["horse_age"] = horseAge;
    data["horse_date_of_birth"] = horseDateOfBirth;
    data["weight_carried_lbs"] = weightCarriedLbs;
    data["official_rating"] = officialRating;
    data["official_rating_today"] = officialRatingToday;
    data["handicap_first_time"] = handicapFirstTime;
    data["jockey_uid"] = jockeyUid;
    data["jockey_name"] = jockeyName;
    data["short_jockey_name"] = shortJockeyName;
    data["weight_allowance_lbs"] = weightAllowanceLbs;
    data["trainer_id"] = trainerId;
    data["trainer_stylename"] = trainerStylename;
    data["short_trainer_name"] = shortTrainerName;
    data["trainer_rtf"] = trainerRtf;
    data["trainer_country_code"] = trainerCountryCode;
    data["rp_topspeed"] = rpTopspeed;
    data["rp_postmark"] = rpPostmark;
    data["rp_postmark_improver"] = rpPostmarkImprover;
    data["unadjusted_rp_postmark"] = unadjustedRpPostmark;
    data["rp_owner_choice"] = rpOwnerChoice;
    data["non_runner"] = nonRunner;
    data["irish_reserve"] = irishReserve;
    data["allowance"] = allowance;
    data["extra_weight"] = extraWeight;
    data["horse_colour_code"] = horseColourCode;
    data["horse_sex_code"] = horseSexCode;
    data["sire_id"] = sireId;
    data["sire_name"] = sireName;
    data["sire_country"] = sireCountry;
    data["first_season_sire_id"] = firstSeasonSireId;
    data["dam_id"] = damId;
    data["dam_name"] = damName;
    data["dam_country"] = damCountry;
    data["damsire_id"] = damsireId;
    data["damsire_name"] = damsireName;
    data["damsire_country"] = damsireCountry;
    data["spotlight"] = spotlight;
    data["diomed"] = diomed;
    data["figures"] = figures;
    data["figures_calculated"] = figuresCalculated;
    data["silk_image_png"] = silkImagePng;
    data["days_since_last_run"] = daysSinceLastRun;
    data["days_since_last_run_flat"] = daysSinceLastRunFlat;
    data["days_since_last_run_jumps"] = daysSinceLastRunJumps;
    data["days_since_last_run_ptp"] = daysSinceLastRunPtp;
    data["new_trainer_races_count"] = newTrainerRacesCount;
    data["selection_cnt"] = selectionCnt;
    data["ten_to_follow_horse"] = tenToFollowHorse;
    data["plus10_horse"] = plus10Horse;
    data["yearling_bonus_horse"] = yearlingBonusHorse;
    data["beaten_favourite"] = beatenFavourite;
    data["forecast_odds_value"] = forecastOddsValue;
    data["forecast_odds_desc"] = forecastOddsDesc;
    data["forecast_odds_style"] = forecastOddsStyle;
    data["course_and_distance_wins"] = courseAndDistanceWins;
    data["course_wins"] = courseWins;
    data["distance_wins"] = distanceWins;
    data["lh_weight_carried_lbs"] = lhWeightCarriedLbs;
    data["out_of_handicap"] = outOfHandicap;
    data["future_rating_difference"] = futureRatingDifference;
    data["running_conditions"] = runningConditions;
    data["country_origin_code"] = countryOriginCode;
    data["silk_image_path"] = silkImagePath;
    data["gelding_first_time"] = geldingFirstTime;
    data["wfa_adjustment"] = wfaAdjustment;
    data["owner_group_uid"] = ownerGroupUid;
    data["official_rating_horse"] = officialRatingHorse;
    data["slow_ground_flat_wins"] = slowGroundFlatWins;
    data["slow_ground_jumps_wins"] = slowGroundJumpsWins;
    data["fast_ground_wins"] = fastGroundWins;
    if (jockeyLast_14Days != null) {
      data["jockey_last_14_days"] = jockeyLast_14Days!.toJson();
    }
    return data;
  }
}

class RaceRunnersModelDataRunners3735128FiguresCalculated {
  String? formFigure;
  String? raceTypeCode;

  RaceRunnersModelDataRunners3735128FiguresCalculated({
    this.formFigure,
    this.raceTypeCode,
  });
  RaceRunnersModelDataRunners3735128FiguresCalculated.fromJson(
      Map<String, dynamic> json) {
    formFigure = json["form_figure"]?.toString();
    raceTypeCode = json["race_type_code"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["form_figure"] = formFigure;
    data["race_type_code"] = raceTypeCode;
    return data;
  }
}

class RaceRunnersModelDataRunners {
  List<RaceRunnersModelDataRunnersModel> data = [];

  RaceRunnersModelDataRunners({
    required this.data,
  });
  RaceRunnersModelDataRunners.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      //print("$key $value");
      data.add(RaceRunnersModelDataRunnersModel.fromJson(value));
    });
    print(data.length);
    // data.forEach((element) {
    //   print(element);
    // });
  }
}

class RaceRunnersModelData {
  RaceRunnersModelDataRunners? runners;

  RaceRunnersModelData({
    this.runners,
  });
  RaceRunnersModelData.fromJson(Map<String, dynamic> json) {
    runners = (json["runners"] != null)
        ? RaceRunnersModelDataRunners.fromJson(json["runners"])
        : null;
  }
}

class RaceRunnersModel {
  RaceRunnersModelData? data;
  int? status;

  RaceRunnersModel({
    this.data,
    this.status,
  });
  RaceRunnersModel.fromJson(Map<String, dynamic> json) {
    data = (json["data"] != null)
        ? RaceRunnersModelData.fromJson(json["data"])
        : null;
    status = json["status"]?.toInt();
  }
}
