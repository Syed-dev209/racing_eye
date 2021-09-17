import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class HorseEntriesModelDataEntriesJockeyLast_14Days {
  int? runs;
  int? wins;
  String? percent;

  HorseEntriesModelDataEntriesJockeyLast_14Days({
    this.runs,
    this.wins,
    this.percent,
  });
  HorseEntriesModelDataEntriesJockeyLast_14Days.fromJson(
      Map<String, dynamic> json) {
    runs = json["runs"]?.toInt();
    wins = json["wins"]?.toInt();
    percent = json["percent"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["runs"] = runs;
    data["wins"] = wins;
    data["percent"] = percent;
    return data;
  }
}

class HorseEntriesModelDataEntries {
  int? index;
  int? raceInstanceUid;
  String? raceDatetime;
  String? courseName;
  String? courseTypeCode;
  int? courseUid;
  String? diffusionCourseName;
  String? courseStyleName;
  String? courseKey;
  String? raceInstanceTitle;
  String? raceStatusCode;
  int? distanceYard;
  int? distanceFurlongRounded;
  String? raceClass;
  String? surface;
  String? rpAgesAllowedDesc;
  String? daysSinceLastRun;
  String? daysSinceLastRunFlat;
  String? daysSinceLastRunJumps;
  String? daysSinceLastRunPtp;
  int? saddleClothNo;
  String? rpPostmark;
  String? runningConditions;
  String? rpOwnerChoice;
  String? silkImagePath;
  String? jockeyUid;
  String? jockeyStyleName;
  HorseEntriesModelDataEntriesJockeyLast_14Days? jockeyLast_14Days;
  String? preference;

  HorseEntriesModelDataEntries({
    this.index,
    this.raceInstanceUid,
    this.raceDatetime,
    this.courseName,
    this.courseTypeCode,
    this.courseUid,
    this.diffusionCourseName,
    this.courseStyleName,
    this.courseKey,
    this.raceInstanceTitle,
    this.raceStatusCode,
    this.distanceYard,
    this.distanceFurlongRounded,
    this.raceClass,
    this.surface,
    this.rpAgesAllowedDesc,
    this.daysSinceLastRun,
    this.daysSinceLastRunFlat,
    this.daysSinceLastRunJumps,
    this.daysSinceLastRunPtp,
    this.saddleClothNo,
    this.rpPostmark,
    this.runningConditions,
    this.rpOwnerChoice,
    this.silkImagePath,
    this.jockeyUid,
    this.jockeyStyleName,
    this.jockeyLast_14Days,
    this.preference,
  });
  HorseEntriesModelDataEntries.fromJson(Map<String, dynamic> json) {
    raceInstanceUid = json["race_instance_uid"]?.toInt();
    raceDatetime = json["race_datetime"]?.toString();
    courseName = json["course_name"]?.toString();
    courseTypeCode = json["course_type_code"]?.toString();
    courseUid = json["course_uid"]?.toInt();
    diffusionCourseName = json["diffusion_course_name"]?.toString();
    courseStyleName = json["course_style_name"]?.toString();
    courseKey = json["course_key"]?.toString();
    raceInstanceTitle = json["race_instance_title"]?.toString();
    raceStatusCode = json["race_status_code"]?.toString();
    distanceYard = json["distance_yard"]?.toInt();
    distanceFurlongRounded = json["distance_furlong_rounded"]?.toInt();
    raceClass = json["race_class"]?.toString();
    surface = json["surface"]?.toString();
    rpAgesAllowedDesc = json["rp_ages_allowed_desc"]?.toString();
    daysSinceLastRun = json["days_since_last_run"]?.toString();
    daysSinceLastRunFlat = json["days_since_last_run_flat"]?.toString();
    daysSinceLastRunJumps = json["days_since_last_run_jumps"]?.toString();
    daysSinceLastRunPtp = json["days_since_last_run_ptp"]?.toString();
    saddleClothNo = json["saddle_cloth_no"]?.toInt();
    rpPostmark = json["rp_postmark"]?.toString();
    runningConditions = json["running_conditions"]?.toString();
    rpOwnerChoice = json["rp_owner_choice"]?.toString();
    silkImagePath = json["silk_image_path"]?.toString();
    jockeyUid = json["jockey_uid"]?.toString();
    jockeyStyleName = json["jockey_style_name"]?.toString();
    jockeyLast_14Days = (json["jockey_last_14_days"] != null)
        ? HorseEntriesModelDataEntriesJockeyLast_14Days.fromJson(
            json["jockey_last_14_days"])
        : null;
    preference = json["preference"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["race_instance_uid"] = raceInstanceUid;
    data["race_datetime"] = raceDatetime;
    data["course_name"] = courseName;
    data["course_type_code"] = courseTypeCode;
    data["course_uid"] = courseUid;
    data["diffusion_course_name"] = diffusionCourseName;
    data["course_style_name"] = courseStyleName;
    data["course_key"] = courseKey;
    data["race_instance_title"] = raceInstanceTitle;
    data["race_status_code"] = raceStatusCode;
    data["distance_yard"] = distanceYard;
    data["distance_furlong_rounded"] = distanceFurlongRounded;
    data["race_class"] = raceClass;
    data["surface"] = surface;
    data["rp_ages_allowed_desc"] = rpAgesAllowedDesc;
    data["days_since_last_run"] = daysSinceLastRun;
    data["days_since_last_run_flat"] = daysSinceLastRunFlat;
    data["days_since_last_run_jumps"] = daysSinceLastRunJumps;
    data["days_since_last_run_ptp"] = daysSinceLastRunPtp;
    data["saddle_cloth_no"] = saddleClothNo;
    data["rp_postmark"] = rpPostmark;
    data["running_conditions"] = runningConditions;
    data["rp_owner_choice"] = rpOwnerChoice;
    data["silk_image_path"] = silkImagePath;
    data["jockey_uid"] = jockeyUid;
    data["jockey_style_name"] = jockeyStyleName;
    if (jockeyLast_14Days != null) {
      data["jockey_last_14_days"] = jockeyLast_14Days!.toJson();
    }
    data["preference"] = preference;
    return data;
  }
}

class HorseEntriesModelData {
  List<HorseEntriesModelDataEntries?>? entries;

  HorseEntriesModelData({
    this.entries,
  });
  HorseEntriesModelData.fromJson(Map<String, dynamic> json) {
    if (json["entries"] != null) {
      int i = 0;
      final v = json["entries"];
      final arr0 = <HorseEntriesModelDataEntries>[];
      v.forEach((v) {
        arr0.add(HorseEntriesModelDataEntries.fromJson(v));
        arr0[i].index = i;
        i = i + 1;
      });
      entries = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (entries != null) {
      final v = entries;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["entries"] = arr0;
    }
    return data;
  }
}

class HorseEntriesModel {
  HorseEntriesModelData? data;
  int? status;

  HorseEntriesModel({
    this.data,
    this.status,
  });
  HorseEntriesModel.fromJson(Map<String, dynamic> json) {
    data = (json["data"] != null)
        ? HorseEntriesModelData.fromJson(json["data"])
        : null;
    status = json["status"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (data != null) {
      data["data"] = this.data!.toJson();
    }
    data["status"] = status;
    return data;
  }
}

class HorseEntriesProvider extends ChangeNotifier {
  HorseEntriesModel? dataModel;
  addDataModel(HorseEntriesModel data) {
    dataModel = data;
    notifyListeners();
  }
}
