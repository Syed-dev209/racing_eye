import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Screens/Components/raceCard.dart';

import '../main.dart';
import 'loginScreen.dart';

class IntroRaceScreen extends StatefulWidget {
  const IntroRaceScreen({Key? key}) : super(key: key);

  @override
  _IntroRaceScreenState createState() => _IntroRaceScreenState();
}

class _IntroRaceScreenState extends State<IntroRaceScreen> {
  var dio = Dio();
  StreamController<List<RaceDetailsModel?>?>? raceController;

  ///Api call
  Future<List<RaceDetailsModel?>?> upcomingRaces() async {
    var response = await dio.get("https://racingeye.ae/shadwell/races/upcoming",
        options: Options(headers: {"Api-Key": apiKey}));
    if (response.statusCode == 200) {
      List<RaceDetailsModel?> list = [];
      for (var i in response.data) {
        list.add(RaceDetailsModel.fromJson(i));
      }
      return list;
    } else {
      return null;
    }
  }

  ///Invoker
  loadRaces() async {
    upcomingRaces().then((value) {
      if (value != null) {
        raceController!.add(value);
        return value;
      } else {
        raceController!.add(null);
        return null;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    raceController = StreamController<List<RaceDetailsModel?>?>();
    loadRaces();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    raceController!.close();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Horse Races',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            height: size.height * 0.98,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: StreamBuilder<List<RaceDetailsModel?>?>(
              stream: raceController!.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasError &&
                    snapshot.connectionState == ConnectionState.waiting) {

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: Text(
                      "No Races",
                      style: TextStyle(
                          color: myColor.shade50.withOpacity(0.6),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }
                List data = [];
                for (var i in snapshot.data!) {
                  data.add(i);
                }
                return data.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (context, i) {
                          return RacesCard(
                            index: 0,
                            dataModel: data[i],
                            navigate: false,
                          );
                        },
                        separatorBuilder: (context, i) => SizedBox(
                              height: 12,
                            ),
                        itemCount: data.length)
                    : Center(
                        child: Text(
                          "No Races",
                          style: TextStyle(
                              color: myColor.shade50.withOpacity(0.6),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            Navigator.pushReplacement(
                context, CupertinoPageRoute(builder: (_) => LoginScreen()));
          },
          child: Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
