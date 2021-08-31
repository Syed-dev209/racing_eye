class HorseModel {
  Data? data;
  int? status;

  HorseModel({this.data, this.status});

  HorseModel.fromJson(Map<String, dynamic> json) {
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
  List<Horses>? horses;
  SeasonInfo? seasonInfo;

  Data({this.horses, this.seasonInfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['horses'] != null) {
      horses = [];
      json['horses'].forEach((v) {
        horses!.add(new Horses.fromJson(v));
      });
    }
    seasonInfo = json['season_info'] != null
        ? new SeasonInfo.fromJson(json['season_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.horses != null) {
      data['horses'] = this.horses!.map((v) => v.toJson()).toList();
    }
    if (this.seasonInfo != null) {
      data['season_info'] = this.seasonInfo!.toJson();
    }
    return data;
  }
}

class Horses {
  int index = 0;
  int? racesNumber;
  int? place1stNumber;
  double? winPrize;
  double? totalPrize;
  int? euroWinPrize;
  int? euroTotalPrize;
  double? netWinPrizeMoney;
  double? netTotalPrizeMoney;
  double? stake;
  int? rpr;
  int? trainerUid;
  String? trainerName;
  String? trainerPtpTypeCode;
  int? horseUid;
  String? horseName;

  Horses(
      {this.racesNumber,
      this.place1stNumber,
      this.winPrize,
      this.totalPrize,
      this.euroWinPrize,
      this.euroTotalPrize,
      this.netWinPrizeMoney,
      this.netTotalPrizeMoney,
      this.stake,
      this.rpr,
      this.trainerUid,
      this.trainerName,
      this.trainerPtpTypeCode,
      this.horseUid,
      this.horseName});

  Horses.fromJson(Map<String, dynamic> json) {
    racesNumber = json['races_number'];
    place1stNumber = json['place_1st_number'];
    winPrize = double.parse(json['win_prize'].toString());
    totalPrize = double.parse(json['total_prize'].toString());
    euroWinPrize = json['euro_win_prize'];
    euroTotalPrize = json['euro_total_prize'];
    netWinPrizeMoney = double.parse(json['net_win_prize_money'].toString());
    netTotalPrizeMoney = double.parse(json['net_total_prize_money'].toString());
    stake = double.parse(json['stake'].toString());
    rpr = json['rpr'];
    trainerUid = json['trainer_uid'];
    trainerName = json['trainer_name'];
    trainerPtpTypeCode = json['trainer_ptp_type_code'];
    horseUid = json['horse_uid'];
    horseName = json['horse_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['races_number'] = this.racesNumber;
    data['place_1st_number'] = this.place1stNumber;
    data['win_prize'] = this.winPrize;
    data['total_prize'] = this.totalPrize;
    data['euro_win_prize'] = this.euroWinPrize;
    data['euro_total_prize'] = this.euroTotalPrize;
    data['net_win_prize_money'] = this.netWinPrizeMoney;
    data['net_total_prize_money'] = this.netTotalPrizeMoney;
    data['stake'] = this.stake;
    data['rpr'] = this.rpr;
    data['trainer_uid'] = this.trainerUid;
    data['trainer_name'] = this.trainerName;
    data['trainer_ptp_type_code'] = this.trainerPtpTypeCode;
    data['horse_uid'] = this.horseUid;
    data['horse_name'] = this.horseName;
    return data;
  }
}

class SeasonInfo {
  int? seasonYearBegin;
  String? raceType;
  String? countryCode;

  SeasonInfo({this.seasonYearBegin, this.raceType, this.countryCode});

  SeasonInfo.fromJson(Map<String, dynamic> json) {
    seasonYearBegin = json['season_year_begin'];
    raceType = json['race_type'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season_year_begin'] = this.seasonYearBegin;
    data['race_type'] = this.raceType;
    data['country_code'] = this.countryCode;
    return data;
  }
}
