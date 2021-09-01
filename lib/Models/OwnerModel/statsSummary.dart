class StatsSummary {
  Data? data;
  int? status;

  StatsSummary({this.data, this.status});

  StatsSummary.fromJson(Map<String, dynamic> json) {
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
  List<StatisticalSummary>? statisticalSummary;
  //SeasonInfo seasonInfo;

  Data({this.statisticalSummary});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['statistical_summary'] != null) {
      statisticalSummary = [];
      json['statistical_summary'].forEach((v) {
        statisticalSummary!.add(new StatisticalSummary.fromJson(v));
      });
    } else {
      statisticalSummary = [];
      statisticalSummary!.add(StatisticalSummary(
          seasonStartDate: DateTime.now().toString(),
          place1stNumber: 0,
          racesNumber: 0,
          winPercent: 0,
          totalPrize: 0.0,
          netTotalPrizeMoney: 0.0,
          stake: 0.0));
    }

    // seasonInfo = json['season_info'] != null
    //     ? new SeasonInfo.fromJson(json['season_info'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statisticalSummary != null) {
      data['statistical_summary'] =
          this.statisticalSummary!.map((v) => v.toJson()).toList();
    } else {}
    // if (this.seasonInfo != null) {
    //   data['season_info'] = this.seasonInfo.toJson();
    // }
    return data;
  }
}

class StatisticalSummary {
  int index = 0;
  int? bestRpPostmark;
  int? horseUid;
  String? horseName;
  int? racePlaced;
  String? seasonStartDate;
  String? seasonEndDate;
  int? racesNumber;
  int? place1stNumber;
  int? place2ndNumber;
  int? place3rdNumber;
  int? place4thNumber;
  double? winPrize;
  double? totalPrize;
  int? euroWinPrize;
  int? euroTotalPrize;
  double? netWinPrizeMoney;
  double? netTotalPrizeMoney;
  double? stake;
  int? winPercent;

  StatisticalSummary(
      {this.bestRpPostmark,
      this.horseUid,
      this.horseName,
      this.racePlaced,
      this.seasonStartDate,
      this.seasonEndDate,
      this.racesNumber,
      this.place1stNumber,
      this.place2ndNumber,
      this.place3rdNumber,
      this.place4thNumber,
      this.winPrize,
      this.totalPrize,
      this.euroWinPrize,
      this.euroTotalPrize,
      this.netWinPrizeMoney,
      this.netTotalPrizeMoney,
      this.stake,
      this.winPercent});

  StatisticalSummary.fromJson(Map<String, dynamic> json) {
    bestRpPostmark = json['best_rp_postmark'];
    horseUid = json['horse_uid'];
    horseName = json['horse_name'];
    racePlaced = json['race_placed'];
    seasonStartDate = json['season_start_date'];
    seasonEndDate = json['season_end_date'];
    racesNumber = json['races_number'];
    place1stNumber = json['place_1st_number'];
    place2ndNumber = json['place_2nd_number'];
    place3rdNumber = json['place_3rd_number'];
    place4thNumber = json['place_4th_number'];
    winPrize = json['win_prize'];
    totalPrize = json['total_prize'];
    euroWinPrize = json['euro_win_prize'];
    euroTotalPrize = json['euro_total_prize'];
    netWinPrizeMoney = json['net_win_prize_money'];
    netTotalPrizeMoney = json['net_total_prize_money'];
    stake = json['stake'];
    winPercent = json['win_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['best_rp_postmark'] = this.bestRpPostmark;
    data['horse_uid'] = this.horseUid;
    data['horse_name'] = this.horseName;
    data['race_placed'] = this.racePlaced;
    data['season_start_date'] = this.seasonStartDate;
    data['season_end_date'] = this.seasonEndDate;
    data['races_number'] = this.racesNumber;
    data['place_1st_number'] = this.place1stNumber;
    data['place_2nd_number'] = this.place2ndNumber;
    data['place_3rd_number'] = this.place3rdNumber;
    data['place_4th_number'] = this.place4thNumber;
    data['win_prize'] = this.winPrize;
    data['total_prize'] = this.totalPrize;
    data['euro_win_prize'] = this.euroWinPrize;
    data['euro_total_prize'] = this.euroTotalPrize;
    data['net_win_prize_money'] = this.netWinPrizeMoney;
    data['net_total_prize_money'] = this.netTotalPrizeMoney;
    data['stake'] = this.stake;
    data['win_percent'] = this.winPercent;
    return data;
  }
}
