import 'package:flutter/cupertino.dart';

class HorseRecordsModel {
  Data? data;
  int? status;

  HorseRecordsModel({this.data, this.status});

  HorseRecordsModel.fromJson(Map<String, dynamic> json) {
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
  LifetimeRecords? lifetimeRecords;

  Data({this.lifetimeRecords});

  Data.fromJson(Map<String, dynamic> json) {
    lifetimeRecords = json['lifetime_records'] != null
        ? new LifetimeRecords.fromJson(json['lifetime_records'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lifetimeRecords != null) {
      data['lifetime_records'] = this.lifetimeRecords!.toJson();
    }
    return data;
  }
}

class LifetimeRecords {
  FlatTurf? flatTurf;
  FlatTurf? rulesRaces;

  LifetimeRecords({this.flatTurf, this.rulesRaces});

  LifetimeRecords.fromJson(Map<String, dynamic> json) {
    flatTurf = json['Flat Turf'] != null
        ? new FlatTurf.fromJson(json['Flat Turf'])
        : null;
    rulesRaces = json['Rules Races'] != null
        ? new FlatTurf.fromJson(json['Rules Races'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flatTurf != null) {
      data['Flat Turf'] = this.flatTurf!.toJson();
    }
    if (this.rulesRaces != null) {
      data['Rules Races'] = this.rulesRaces!.toJson();
    }
    return data;
  }
}

class FlatTurf {
  int? starts;
  int? wins;
  int? i2nds;
  int? i3rds;
  double? winnigs;
  double? earnings;
  double? totalPrize;
  double? winPrize;
  double? netTotalPrize;
  double? netWinPrize;
  int? euroWinPrize;
  int? euroTotalPrize;
  double? usdWinPrize;
  double? usdTotalPrize;
  int? bestTs;
  int? bestRpr;
  int? or;
  double? stake;
  int? latestBhb;

  FlatTurf(
      {this.starts,
      this.wins,
      this.i2nds,
      this.i3rds,
      this.winnigs,
      this.earnings,
      this.totalPrize,
      this.winPrize,
      this.netTotalPrize,
      this.netWinPrize,
      this.euroWinPrize,
      this.euroTotalPrize,
      this.usdWinPrize,
      this.usdTotalPrize,
      this.bestTs,
      this.bestRpr,
      this.or,
      this.stake,
      this.latestBhb});

  FlatTurf.fromJson(Map<String, dynamic> json) {
    starts = json['starts'];
    wins = json['wins'];
    i2nds = json['2nds'];
    i3rds = json['3rds'];
    winnigs = double.parse(json['winnigs'].toString());
    earnings = json['earnings'];
    totalPrize = json['total_prize'];
    winPrize = double.parse(json['win_prize'].toString());
    netTotalPrize = json['net_total_prize'];
    netWinPrize = double.parse(json['net_win_prize'].toString());
    euroWinPrize = json['euro_win_prize'];
    euroTotalPrize = json['euro_total_prize'];
    usdWinPrize = json['usd_win_prize'];
    usdTotalPrize = json['usd_total_prize'];
    bestTs = json['best_ts'];
    bestRpr = json['best_rpr'];
    or = json['or+'];
    stake = json['stake'];
    latestBhb = json['latest_bhb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['starts'] = this.starts;
    data['wins'] = this.wins;
    data['2nds'] = this.i2nds;
    data['3rds'] = this.i3rds;
    data['winnigs'] = this.winnigs;
    data['earnings'] = this.earnings;
    data['total_prize'] = this.totalPrize;
    data['win_prize'] = this.winPrize;
    data['net_total_prize'] = this.netTotalPrize;
    data['net_win_prize'] = this.netWinPrize;
    data['euro_win_prize'] = this.euroWinPrize;
    data['euro_total_prize'] = this.euroTotalPrize;
    data['usd_win_prize'] = this.usdWinPrize;
    data['usd_total_prize'] = this.usdTotalPrize;
    data['best_ts'] = this.bestTs;
    data['best_rpr'] = this.bestRpr;
    data['or+'] = this.or;
    data['stake'] = this.stake;
    data['latest_bhb'] = this.latestBhb;
    return data;
  }
}

class HorseRecordProvider extends ChangeNotifier {
  HorseRecordsModel? recordsModel;
  addHorserecods(HorseRecordsModel data) {
    recordsModel = data;
    notifyListeners();
  }
}
