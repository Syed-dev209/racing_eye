import 'dart:convert';

import 'package:racing_eye/Models/ownerData.dart';
import 'package:http/http.dart' as http;

const String apiKey = "SYE0PzpfZy2nGQpeKo88TtYaIZUNeERt";

Future<List<Owners>> getAllOwnerList() async {
  List<Owners> ownerList = [];
  String url = "https://re.victoriayachts.ae/owners";
  var response = await http.get(Uri.parse(url), headers: {"Api-key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    for (var data in decodedData) {
      ownerList.add(Owners.fromJson(data));
    }
  } else {
    print("response failed");
  }
  return ownerList;
}
