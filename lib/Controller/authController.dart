import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:racing_eye/Controller/ownerAPIController.dart';

Future loginWithPassword(context, String pass) async {
  try {
    var response = await http.post(
      Uri.parse("https://re.victoriayachts.ae/quick-login"),
      body: {"password": pass},
      // headers: {"Api-Key": apiKey}
    );
    var jsonData = jsonDecode(response.body);
    if (jsonData['response'] == "success") {
      return "1";
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonData['msg'])));
      return "0";
    }
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Something went wrong')));
    return "0";
  }
}
