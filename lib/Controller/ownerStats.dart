import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/ownerSearchStatsModel.dart';

var dio = Dio();
Future getOwnerStats(int ownerId, String year, String endYear,context) async {
  print(ownerId);
  var response = await dio.get("https://racingeye.ae/shadwell/stats",
      queryParameters: {"owner_id": ownerId,"year_start":year,"year_end":endYear},
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
