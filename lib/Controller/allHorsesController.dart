import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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
  String url = "https://racingeye.ae/shadwell/horses";
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
  String url = "https://racingeye.ae/shadwell/horses/";
  final uri = Uri.parse(url);
  final newuri = uri.replace(queryParameters: {"horse_id": horseId});
  var response = await http.get(newuri, headers: {
    "Api-Key": apiKey,
    HttpHeaders.contentTypeHeader: 'application/json'
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    List<HorseProfileModel> models = [];
    for (var i in decodedData) {
      models.add(HorseProfileModel.fromJson(i));
    }
    Provider.of<HorseProfileProvider>(context, listen: false).clearProvider();
    Provider.of<HorseProfileProvider>(context, listen: false)
        .addProfile(models[0]);
  }
}

getHorseRecords(context, String horseId) async {
  print(horseId);
  String url = "https://racingeye.ae/shadwell/horse/records/";
  final uri = Uri.parse(url);
  final newuri = uri.replace(queryParameters: {"horse_id": horseId});
  var response = await http.get(newuri, headers: {
    "Api-Key": apiKey,
    HttpHeaders.contentTypeHeader: 'application/json'
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    Provider.of<HorseRecordProvider>(context, listen: false).clearProvider();
    Provider.of<HorseRecordProvider>(context, listen: false)
        .addHorserecods(decodedData);
  }
}

getHorseSalesData(context, String horseid) async {
  String url = "https://racingeye.ae/shadwell/horse/sales/";
  final uri = Uri.parse(url);
  final newuri = uri.replace(queryParameters: {"horse_id": horseid});
  var response = await http.get(newuri, headers: {
    "Api-Key": apiKey,
    HttpHeaders.contentTypeHeader: 'application/json'
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);

    print("Sales status 200");
    List<HorseSalesModel> sales = [];
    for (var i in decodedData) {
      sales.add(HorseSalesModel.fromJson(i));
    }
    print(decodedData);
    Provider.of<HorseSalesProvider>(context, listen: false).clearProvider();
    Provider.of<HorseSalesProvider>(context, listen: false)
        .addSalesModel(sales);
  }
}

getHorseFormData(context, String horseId) async {
  String url = "https://racingeye.ae/shadwell/horse/forms/";
  final uri = Uri.parse(url);
  final newuri = uri.replace(queryParameters: {"horse_id": horseId});
  var response = await http.get(newuri, headers: {
    "Api-Key": apiKey,
    HttpHeaders.contentTypeHeader: 'application/json'
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    List<HorseFormModel> models = [];
    for (var data in decodedData) {
      models.add(HorseFormModel.fromJson(data));
    }
    print(models.length);
    Provider.of<HorseFormProvider>(context, listen: false).clearProvider();
    Provider.of<HorseFormProvider>(context, listen: false).addFormData(models);
  }
}

getHorseEntries(context, String horseId) async {
  String url = "https://racingeye.ae/shadwell/horse/entries/";
  final uri = Uri.parse(url);
  final newuri = uri.replace(queryParameters: {"horse_id": horseId});
  var response = await http.get(newuri, headers: {"Api-Key": apiKey});
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    List<HorseEntriesModel> models = [];
    for (var i in decodedData) {
      models.add(HorseEntriesModel.fromJson(i));
    }
    Provider.of<HorseEntriesProvider>(context, listen: false).clearProvider();
    Provider.of<HorseEntriesProvider>(context, listen: false)
        .addDataModel(models);
  }
}
