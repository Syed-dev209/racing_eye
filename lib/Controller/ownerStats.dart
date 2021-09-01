import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/ownerSearchStatsModel.dart';

Future getOwnerStats(int ownerId, String year, context) async {
  String url =
      "https://re.victoriayachts.ae/stats?owner_id=$ownerId&year=$year";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    for (var i in decodedData) {
      print(i);
      Provider.of<OwnerSearchStatsProvider>(context, listen: false)
          .addOwnerStats(OwnerSearchStatsModel.fromJson(i));
    }
  }
}
