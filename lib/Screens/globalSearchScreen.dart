import 'dart:async';

import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/globalSearchController.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerCard.dart';
import 'package:racing_eye/Screens/Components/dropDowns.dart';
import 'package:racing_eye/Screens/Components/horsecard.dart';
import 'package:racing_eye/Screens/Components/raceCard.dart';
import 'package:racing_eye/Services/internet_connection.dart';

import '../main.dart';
import 'Components/customWhiteAppBar.dart';

enum Option { Horse, Jockey, Race, Branch }

class GlobalSearchScreen extends StatefulWidget {
  const GlobalSearchScreen({Key? key}) : super(key: key);

  @override
  _GlobalSearchScreenState createState() => _GlobalSearchScreenState();
}

class _GlobalSearchScreenState extends State<GlobalSearchScreen> {
  List<String> options = ["Horse", "Jockey", "Race", "Owner"];
  String? selectedOption;
  TextEditingController searchController = TextEditingController();
  List<Widget> cards = [];
  bool loaded = true;
  bool error = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedOption = options.first;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.98,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomWhiteAppBar(
            headerText: "Search",
            showTrailing: false,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: "Search",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black26)),
            child: dropDownAndroid(options, selectedOption!, (val) {
              setState(() {
                selectedOption = val;
              });
            }),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 13)),
              onPressed: () async {
                bool check = await InternetService.checkConnectivity();
                String type = selectedOption!.toLowerCase();
                setState(() {
                  cards.clear();
                  loaded = false;
                });
                if (check) {
                  globallySearch(type, searchController.text).then((value) {
                    if (value != null) {
                      if (type == "horse") {
                        ///horse
                        List<HorsesDetailModel> horseDataList = [];
                        horseDataList.addAll(value);
                        for (var i in horseDataList) {
                          cards.add(HorseCard(horseModel: i));
                        }
                      } else if (type == "owner") {
                        ///owner
                        List<OwnersData> ownerDataList = [];
                        ownerDataList.addAll(value);
                        for (var i in ownerDataList) {
                          cards.add(OwnerCard(ownerData: i));
                        }
                      } else if (type == "race") {
                        ///race
                        List<RaceDetailsModel> raceDataList = [];
                        raceDataList.addAll(value);
                        for (var i in raceDataList) {
                          cards.add(RacesCard(dataModel: i));
                        }
                      } else {
                        ///type=jockey
                        List<RaceDetailsModel> jockeyDataList = [];
                        jockeyDataList.addAll(value);
                        for (var i in jockeyDataList) {
                          cards.add(RacesCard(dataModel: i));
                        }
                      }
                    } else {
                      error = true;
                    }
                    setState(() {
                      loaded = true;
                    });
                  });
                } else {
                  loaded = true;
                  error = true;
                }
                setState(() {});
              },
              child: Text('Search'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 1,
            width: double.maxFinite,
            color: Colors.black26,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: loaded
                  ? cards.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, i) {
                            return cards[i];
                          },
                          separatorBuilder: (context, i) => SizedBox(
                                height: 12,
                              ),
                          itemCount: cards.length)
                      : Center(
                          child: Text(
                            "No search results",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: myColor.shade50.withOpacity(0.5)),
                          ),
                        )
                  : Center(
                      child: CircularProgressIndicator(),
                    ))
        ],
      ),
    );
  }
}
