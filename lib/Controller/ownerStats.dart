import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/ownerSearchStatsModel.dart';

var dio = Dio();
Future getOwnerStats(int ownerId, String year, context) async {
  String url =
      "https://re.victoriayachts.ae/stats?owner_id=$ownerId&year=$year";
  // var response = await http.get(
  //     Uri.https("https://racingeye.ae", "/shadwell/stats", {
  //       "owner_id": ownerId,
  //     }),
  //     headers: {"Api-Key": apiKey});
  var response = await dio.get("https://racingeye.ae/shadwell/stats",
      queryParameters: {"owner_id": ownerId},
      options: Options(headers: {"Api-Key": apiKey}));

  if (response.statusCode == 200) {
    // var decodedData = jsonDecode(response.body);
    for (var i in response.data) {
      print(i);
      Provider.of<OwnerSearchStatsProvider>(context, listen: false)
          .addOwnerStats(OwnerSearchStatsModel.fromJson(i));
    }
  }
}
