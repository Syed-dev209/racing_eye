import 'package:flutter/cupertino.dart';

class HorseSalesModelSales {
  String? buyerDetail;
  int? price;
  String? saleDate;
  String? venueDesc;
  int? venueUid;
  int? lotNo;
  String? lotLetter;
  String? sellerName;
  String? curCode;
  String? saleName;
  String? abbrevName;
  String? saleType;
  int? index;

  HorseSalesModelSales({
    this.index,
    this.buyerDetail,
    this.price,
    this.saleDate,
    this.venueDesc,
    this.venueUid,
    this.lotNo,
    this.lotLetter,
    this.sellerName,
    this.curCode,
    this.saleName,
    this.abbrevName,
    this.saleType,
  });
  HorseSalesModelSales.fromJson(Map<String, dynamic> json) {
    buyerDetail = json["buyer_detail"]?.toString();
    price = json["price"]?.toInt();
    saleDate = json["sale_date"]?.toString();
    venueDesc = json["venue_desc"]?.toString();
    venueUid = json["venue_uid"]?.toInt();
    lotNo = json["lot_no"]?.toInt();
    lotLetter = json["lot_letter"]?.toString();
    sellerName = json["seller_name"]?.toString();
    curCode = json["cur_code"]?.toString();
    saleName = json["sale_name"]?.toString();
    abbrevName = json["abbrev_name"]?.toString();
    saleType = json["sale_type"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["buyer_detail"] = buyerDetail;
    data["price"] = price;
    data["sale_date"] = saleDate;
    data["venue_desc"] = venueDesc;
    data["venue_uid"] = venueUid;
    data["lot_no"] = lotNo;
    data["lot_letter"] = lotLetter;
    data["seller_name"] = sellerName;
    data["cur_code"] = curCode;
    data["sale_name"] = saleName;
    data["abbrev_name"] = abbrevName;
    data["sale_type"] = saleType;
    return data;
  }
}

class HorseSalesModel {
  List<HorseSalesModelSales?>? sales;
  int? status;

  HorseSalesModel({
    this.sales,
    this.status,
  });
  HorseSalesModel.fromJson(Map<String, dynamic> json) {
    int i = 0;
    if (json["sales"] != null) {
      print("sales not null");
      final v = json["sales"];
      print(v);
      List<HorseSalesModelSales?> arr0 = [];
      v.forEach((value) {
        arr0.add(HorseSalesModelSales.fromJson(value));
        arr0[i]!.index = i;
        i = i + 1;
      });
      sales = arr0;
    } else {
      print("sales null");
    }
    //status = json["status"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (sales != null) {
      final v = sales;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["sales"] = arr0;
    }
    data["status"] = status;
    return data;
  }
}

class HorseSalesProvider extends ChangeNotifier {
  HorseSalesModel? salesModel;
  addSalesModel(HorseSalesModel data) {
    salesModel = data;
    notifyListeners();
  }
}
