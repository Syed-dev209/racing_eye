import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/statsModel.dart';

Future getStatus(context) async {
  String url = "https://racingeye.ae/shadwell/stats";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});

  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<StatsProvider>(context, listen: false)
        .setStatsData(StatsModel.fromJson(decodedData.first));
  }
}
