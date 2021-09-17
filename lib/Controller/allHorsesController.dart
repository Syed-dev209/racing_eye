import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/horseEntriesModel.dart';
import 'package:racing_eye/Models/horseFormModel.dart';
import 'package:racing_eye/Models/horseProfileModel.dart';
import 'package:racing_eye/Models/horseRecordsModel.dart';
import 'package:racing_eye/Models/horseSalesModel.dart';
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

getHorseProfile(context, String horseId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/horse/$horseId/overview";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<HorseProfileProvider>(context, listen: false)
        .addProfile(HorseProfileModel.fromJson(decodedData));
  }
}

getHorseRecords(context, String horseId) async {
  print(horseId);
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/horse/$horseId/record";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    if (decodedData["status"] == 200) {
      print(decodedData);
      Provider.of<HorseRecordProvider>(context, listen: false)
          .addHorserecods(HorseRecordsModel.fromJson(decodedData));
    }
  }
}

getHorseSalesData(context, String horseid) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/horse/$horseid/sales";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    if (decodedData["status"] == 200) {
      print("Sales status 200");
      print(decodedData);
      Provider.of<HorseSalesProvider>(context, listen: false)
          .addSalesModel(HorseSalesModel.fromJson(decodedData["data"]));
    } else {
      print("Sales status != 200");
      Provider.of<HorseSalesProvider>(context, listen: false)
          .addSalesModel(HorseSalesModel(status: decodedData["status"], sales: [
        HorseSalesModelSales(
            index: 0,
            buyerDetail: "N/A",
            price: 0,
            saleDate: "",
            saleName: "N/A",
            abbrevName: "N/A",
            venueDesc: "N/A",
            lotNo: 0,
            sellerName: "N/A")
      ]));
    }
  }
}

getHorseFormData(context, String horseId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/horse/$horseId/form";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    if (decodedData["status"] == 200) {
      Provider.of<HorseFormProvider>(context, listen: false)
          .addFormData(HorseFormModel.fromJson(decodedData["data"]));
    } else {
      print("Clear 3 with status code != 200");
      Provider.of<HorseFormProvider>(context, listen: false)
          .addFormData(HorseFormModel(form: [
        HorseFormModelForm(
            index: 0,
            raceDatetime: "2010-07-01T19:40:23",
            courseRpAbbrev_3: "N/A",
            distanceFurlong: 0,
            raceOutcomeCode: "N/A",
            noOfRunners: 0,
            oddsDesc: "N/A",
            officialRatingRanOff: 0)
      ]));
    }
  }
}

getHorseEntries(context, String horseId) async {
  String url =
      "https://re.victoriayachts.ae/api/?q=profile/horse/$horseId/entries";
  var response = await http.get(Uri.parse(url), headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    if (decodedData["status"] == 200) {
      Provider.of<HorseEntriesProvider>(context, listen: false)
          .addDataModel(HorseEntriesModel.fromJson(decodedData));
    } else {
      Provider.of<HorseEntriesProvider>(context, listen: false).addDataModel(
        HorseEntriesModel(
          data: HorseEntriesModelData(entries: [
            HorseEntriesModelDataEntries(
                raceDatetime: "2010-07-01T19:40:23",
                raceInstanceTitle: "N/A",
                courseStyleName: "N/A",
                index: 0)
          ]),
        ),
      );
    }
  }
}
