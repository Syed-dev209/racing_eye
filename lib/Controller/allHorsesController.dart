import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';

Future getAllHorsesData(context) async {
  String url = "https://re.victoriayachts.ae/horses";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    Provider.of<HorseDetailProvider>(context, listen: false).dataModel.clear();
    var decodedData = jsonDecode(response.body);
    for (var data in decodedData) {
      Provider.of<HorseDetailProvider>(context, listen: false)
          .addHorse(HorsesDetailModel.fromJson(data));
    }
  }
}
