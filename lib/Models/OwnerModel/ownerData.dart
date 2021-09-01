import 'package:flutter/cupertino.dart';

class OwnersData {
  int? id;
  int? uid;
  String? ownerName;
  String? ptpTypeCode;
  String? silk;
  String? styleName;
  String? silkImagePath;
  String? createdAt;
  String? updatedAt;

  OwnersData(
      {required this.id,
      required this.uid,
      required this.ownerName,
      required this.ptpTypeCode,
      required this.silk,
      required this.styleName,
      required this.silkImagePath,
      required this.createdAt,
      required this.updatedAt});

  OwnersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    ownerName = json['owner_name'];
    ptpTypeCode = json['ptp_type_code'];
    silk = json['silk'];
    styleName = json['style_name'];
    silkImagePath = json['silk_image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['owner_name'] = this.ownerName;
    data['ptp_type_code'] = this.ptpTypeCode;
    data['silk'] = this.silk;
    data['style_name'] = this.styleName;
    data['silk_image_path'] = this.silkImagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OwnerDataProvider extends ChangeNotifier {
  List<OwnersData> ownerList = [];
  addOwner(OwnersData data) {
    ownerList.add(data);
    notifyListeners();
  }
}
