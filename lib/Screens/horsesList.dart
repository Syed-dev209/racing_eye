import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/allHorsesController.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/dropDowns.dart';
import 'package:racing_eye/main.dart';

import 'Components/horsecard.dart';

class HorsesList extends StatefulWidget {
  const HorsesList({Key? key}) : super(key: key);

  @override
  _HorsesListState createState() => _HorsesListState();
}

class _HorsesListState extends State<HorsesList> {
  List<String> ages = ["Age", "1", "2", "3", "4", "6"];
  String age = "Age";
  String owner = "";
  List<OwnersData> ownerNames = [];
  OwnersData? ownerName;
  TextEditingController searchedItem = TextEditingController();
  List<HorsesDetailModel> preservedHorseList = [];
  ScrollController scrollController = ScrollController();
  int _debouncetime = 500;
  Timer? _debounce;
  String searchWord = '';

  @override
  void initState() {
    super.initState();
    ownerNames.add(OwnersData(
        id: 0,
        uid: 0,
        ownerName: "Branches",
        ptpTypeCode: " ",
        silk: " ",
        styleName: " ",
        silkImagePath: " ",
        createdAt: " ",
        updatedAt: " ",
        countryFlag: " "));
    for (var data
        in Provider.of<OwnerDataProvider>(context, listen: false).ownerList) {
      ownerNames.add(data);
    }
    ownerName = ownerNames.first;
    final prov =
        Provider.of<HorseDetailProvider>(context, listen: false).dataModel;
    for (var i in prov) {
      preservedHorseList.add(i);
    }

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          getHorses();
        }
      }
    });
  }

  getHorses({String? searchKeyword, int? customLimit}) async {
    final provider = Provider.of<HorseDetailProvider>(context, listen: false);
    log(provider.totalLimit.toString());
    // if (provider.currentLimit < provider.totalLimit) {
    provider.updateLoadingState(true);
    log("Current limit===> ${provider.currentLimit}");
    int limit = 0;
    if ((provider.totalLimit - provider.currentLimit) < 10) {
      limit =
          provider.currentLimit + (provider.totalLimit - provider.currentLimit);
    } else {
      limit = provider.currentLimit + 10;
    }
    log("requsted limit=> $limit");
    if (limit <= provider.totalLimit) {}
    await getAllHorsesData(context,
        limit: customLimit ??= limit == 0 ? 10 : limit,
        ownerId: ownerName == ownerNames.first ? null : ownerName?.uid,
        age: int.tryParse(age),
        searchWord: searchWord);
    log("Changed limit===> ${provider.currentLimit}");
    provider.updateLoadingState(false);
    //}
  }

  @override
  void deactivate() {
    Provider.of<HorseDetailProvider>(context, listen: false).dataModel =
        preservedHorseList;
    Provider.of<HorseDetailProvider>(context, listen: false).setToBasics();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomWhiteAppBar(
          headerText: 'Horses',
          showTrailing: false,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.98,
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
            child: Column(
              children: [
                Expanded(
                  child: Consumer<HorseDetailProvider>(
                    builder: (context, data, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: double.maxFinite,
                            child: TextFormField(
                              controller: searchedItem,
                              onChanged: (val) {
                                searchWord = val;
                                if (_debounce?.isActive ?? false)
                                  _debounce?.cancel();
                                _debounce = Timer(
                                    Duration(milliseconds: _debouncetime), () {
                                  ///here you perform your search
                                  getHorses(
                                      searchKeyword: searchWord,
                                      customLimit: 10);
                                });

                                // if (val.isNotEmpty) {
                                //   List<HorsesDetailModel> searchedList = [];
                                //   for (var i in preservedHorseList) {
                                //     if (i.horseName!.contains(RegExp(
                                //         searchedItem.text,
                                //         caseSensitive: false))) {
                                //       searchedList.add(i);
                                //     }
                                //   }
                                //   print(searchedList.length);
                                //   data.addHorseList(searchedList);
                                // } else {
                                //   data.addHorseList(preservedHorseList);
                                // }
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 4, left: 15),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: myColor.shade100,
                                    size: 18,
                                  ),
                                  labelText: "Horse Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Text(
                            "Filters",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10.5,
                          ),
                          Row(
                            children: [
                              ///**************Age Filter*******************///
                              Expanded(
                                child: dropDownAndroid(
                                  ages,
                                  age,
                                  (val) {
                                    setState(() {
                                      age = val;
                                    });
                                    getHorses(customLimit: 10);
                                    // if (age == ages.first) {
                                    //   data.addHorseList(preservedHorseList);
                                    // } else {
                                    //   List<HorsesDetailModel> searchedList = [];
                                    //   for (var i in preservedHorseList) {
                                    //     DateTime parseData =
                                    //         DateTime.parse(i.horseDateOfBirth!);
                                    //     DateTime now = DateTime.now();
                                    //     int age = now.year - parseData.year;
                                    //     if (age == int.parse(val)) {
                                    //       searchedList.add(i);
                                    //     }
                                    //   }
                                    //   data.addHorseList(searchedList);
                                    // }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              ///**************Owner Filter*******************///
                              Expanded(
                                child: dropDownAndroidOwner(
                                    ownerNames, ownerName!, (val) {
                                  ownerName = val;
                                  getHorses(customLimit: 10);
                                  // if (ownerName == ownerNames.first) {
                                  //   data.addHorseList(preservedHorseList);
                                  // } else {
                                  //   List<HorsesDetailModel> searchedList = [];
                                  //   for (var i in preservedHorseList) {
                                  //     if (i.ownerName!.toLowerCase() ==
                                  //         ownerName!.ownerName!.toLowerCase()) {
                                  //       searchedList.add(i);
                                  //     }
                                  //   }
                                  //   data.addHorseList(searchedList);
                                  // }
                                }),
                              )
                            ],
                          ),
                          data.loading
                              ? Center(
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              : SizedBox.shrink(),
                          data.dataModel.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                      controller: scrollController,
                                      itemCount: data.dataModel.length,
                                      itemBuilder: (context, index) {
                                        return HorseCard(
                                            horseModel: data.dataModel[index]);
                                      }),
                                )
                              : Container(
                                  height: 400,
                                  width: double.maxFinite,
                                  child: Center(
                                    child: Text(
                                      ' No horses available',
                                      style: TextStyle(
                                          color: myColor.withOpacity(0.5),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
