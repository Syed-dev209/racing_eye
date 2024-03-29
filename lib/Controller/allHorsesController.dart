import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/horseEntriesModel.dart';
import 'package:racing_eye/Models/horseFormModel.dart';
import 'package:racing_eye/Models/horseProfileModel.dart';
import 'package:racing_eye/Models/horseRecordsModel.dart';
import 'package:racing_eye/Models/horseSalesModel.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';

var dio = Dio();
Future getAllHorsesData(context,
    {int limit = 10, int? ownerId, int? age, String? searchWord}) async {
  String url = "https://racingeye.ae/shadwell/horses";
  Map<String, dynamic> variables = {
    "page_limt": limit,
    if (ownerId != null) "owner_id": ownerId,
    if (age != null) "horse_age": age,
    if (searchWord != null) "horse_name": searchWord
  };
  log(variables.toString());
  var response = await dio.get(
    url,
    queryParameters: variables,
    options: Options(headers: {"Api-Key": apiKey}),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    final provider = Provider.of<HorseDetailProvider>(context, listen: false);
    var decodedData = response.data;
    provider.setCurrentLimit(limit);
    provider.setTotalLimit(decodedData['total']);
    provider.dataModel.clear();
    for (var data in decodedData['data']) {
      provider.addHorse(HorsesDetailModel.fromJson(data));
    }
  }
}

Future getHorseProfile(context, String horseId) async {
  // try {
  String url = "https://racingeye.ae/shadwell/horses/";
  final uri = Uri.parse(url);
  final newuri = uri.replace(queryParameters: {"horse_id": horseId});
  var response = await http.get(newuri, headers: {
    "Api-Key": apiKey,
    HttpHeaders.contentTypeHeader: 'application/json'
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    log(decodedData.toString());
    List<HorseProfileModel> models = [];
    print(models.length);
    for (var i in decodedData['data']) {
      models.add(HorseProfileModel.fromJson(i));
    }

    Provider.of<HorseProfileProvider>(context, listen: false).clearProvider();
    Provider.of<HorseProfileProvider>(context, listen: false)
        .addProfile(models.isNotEmpty ? models[0] : null);
    return true;
  } else {
    return null;
  }
  // } catch (e) {
  //   return null;
  // }
}

Future getHorseRecords(context, String horseId) async {
  try {
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
      return true;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future getHorseSalesData(context, String horseid) async {
  //try {
  String url = "https://racingeye.ae/shadwell/horse/sales/";
  final uri = Uri.parse(url);
  final newuri = uri.replace(queryParameters: {"horse_id": horseid});
  var response = await http.get(newuri, headers: {
    "Api-Key": apiKey,
    HttpHeaders.contentTypeHeader: 'application/json'
  });
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    List<HorseSalesModel> sales = [];
    for (var i in decodedData) {
      sales.add(HorseSalesModel.fromJson(i));
    }
    print(decodedData);
    Provider.of<HorseSalesProvider>(context, listen: false).clearProvider();
    Provider.of<HorseSalesProvider>(context, listen: false)
        .addSalesModel(sales);
    return true;
  } else {
    return null;
  }
  // } catch (e) {
  //   return null;
  // }
}

Future getHorseFormData(context, String horseId) async {
  // try {
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
    return true;
  } else {
    return null;
  }
  // } catch (e) {
  //   return null;
  // }
}

Future getHorseEntries(context, String horseId) async {
  try {
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

      return true;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future getAllHorseData(context, String horseId) async {
  //https://racingeye.ae/shadwell/horse-details?horse_id=964565
  String url = "https://racingeye.ae/shadwell/horse-details";
  var response = await Dio().get(url,
      queryParameters: {"horse_id": horseId},
      options: Options(headers: {"Api-Key": apiKey}));
  log(response.data.toString());

  ///profile
  Provider.of<HorseProfileProvider>(context, listen: false).clearProvider();
  Provider.of<HorseProfileProvider>(context, listen: false)
      .addProfile(HorseProfileModel.fromJson(response.data["overview"]));

  ///entries
  List<HorseEntriesModel> models = [];
  if (response.data["entries"] != null) {
    for (var i in response.data["entries"]) {
      models.add(HorseEntriesModel.fromJson(i));
    }
  }
  Provider.of<HorseEntriesProvider>(context, listen: false).clearProvider();
  Provider.of<HorseEntriesProvider>(context, listen: false)
      .addDataModel(models);

  ///form
  List<HorseFormModel> formList = [];
  Map<String, dynamic> forms = response.data["form"];
  forms.forEach((key, value) {
    formList.add(HorseFormModel.fromJson(value));
  });
  log("Form length ${formList.length}");
  Provider.of<HorseFormProvider>(context, listen: false).clearProvider();
  Provider.of<HorseFormProvider>(context, listen: false).addFormData(formList);

  ///sales
  List<HorseSalesModel> sales = [];
  for (var i in response.data["sales"]) {
    sales.add(HorseSalesModel.fromJson(i));
  }
  Provider.of<HorseSalesProvider>(context, listen: false).clearProvider();
  Provider.of<HorseSalesProvider>(context, listen: false).addSalesModel(sales);
}
