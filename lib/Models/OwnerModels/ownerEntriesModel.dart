class OwnerEntries {
  Data? data;
  int? status;

  OwnerEntries({this.data, this.status});

  OwnerEntries.fromJson(Map<String, dynamic> json) {
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
  List<Entries>? entries = [];

  Data({required this.entries});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['entries'] != null) {
      entries = [];
      json['entries'].forEach((v) {
        entries!.add(new Entries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entries != null) {
      data['entries'] = this.entries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  int index = 0;
  int? raceInstanceUid;
  int? horseUid;
  String? horseName;
  String? raceDatetime;
  String? courseName;
  String? courseStyleName;
  int? courseUid;
  String? courseTypeCode;
  String? diffusionCourseName;
  String? courseKey;
  String? raceInstanceTitle;
  String? raceStatusCode;
  dynamic runningConditions;

  Entries(
      {this.raceInstanceUid,
      this.horseUid,
      this.horseName,
      this.raceDatetime,
      this.courseName,
      this.courseStyleName,
      this.courseUid,
      this.courseTypeCode,
      this.diffusionCourseName,
      this.courseKey,
      this.raceInstanceTitle,
      this.raceStatusCode,
      this.runningConditions});

  Entries.fromJson(Map<String, dynamic> json) {
    raceInstanceUid = json['race_instance_uid'];
    horseUid = json['horse_uid'];
    horseName = json['horse_name'];
    raceDatetime = json['race_datetime'];
    courseName = json['course_name'];
    courseStyleName = json['course_style_name'];
    courseUid = json['course_uid'];
    courseTypeCode = json['course_type_code'];
    diffusionCourseName = json['diffusion_course_name'];
    courseKey = json['course_key'];
    raceInstanceTitle = json['race_instance_title'];
    raceStatusCode = json['race_status_code'];
    runningConditions = json['running_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['race_instance_uid'] = this.raceInstanceUid;
    data['horse_uid'] = this.horseUid;
    data['horse_name'] = this.horseName;
    data['race_datetime'] = this.raceDatetime;
    data['course_name'] = this.courseName;
    data['course_style_name'] = this.courseStyleName;
    data['course_uid'] = this.courseUid;
    data['course_type_code'] = this.courseTypeCode;
    data['diffusion_course_name'] = this.diffusionCourseName;
    data['course_key'] = this.courseKey;
    data['race_instance_title'] = this.raceInstanceTitle;
    data['race_status_code'] = this.raceStatusCode;
    data['running_conditions'] = this.runningConditions;
    return data;
  }
}
