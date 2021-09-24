import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerStats.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/ownerSearchStatsModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/dropDowns.dart';
import 'package:racing_eye/Screens/Components/searchCard.dart';
import 'package:racing_eye/main.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> years = [
    "Select",
    "2015",
    "2016",
    "2017",
    "2011",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024"
  ];
  List<OwnersData> ownerNames = [];
  String startYear = "2021";
  String endYear = "2021";
  OwnersData? ownerName;
  bool loaded = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ownerNames.add(OwnersData(
        id: 0,
        uid: 0,
        ownerName: "All",
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWhiteAppBar(
                headerText: 'Search',
                showTrailing: false,
              ),
              SizedBox(
                height: 45.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start year",
                        style: TextStyle(
                            color: Color(0xffBBC3CE),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      dropDownAndroid(years, startYear, (val) async {
                        setState(() {
                          startYear = val;
                          loaded = false;
                        });
                        if (ownerName!.ownerName == "All") {
                          Provider.of<OwnerSearchStatsProvider>(context,
                                  listen: false)
                              .clearList();
                          for (var i in Provider.of<OwnerDataProvider>(context,
                                  listen: false)
                              .ownerList) {
                            await getOwnerStats(i.uid!, startYear, context);
                          }
                        } else {
                          Provider.of<OwnerSearchStatsProvider>(context,
                                  listen: false)
                              .clearList();
                          await getOwnerStats(
                              ownerName!.uid!, startYear, context);
                        }
                        setState(() {
                          loaded = true;
                        });
                      }),
                    ],
                  )),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Year',
                        style: TextStyle(
                            color: Color(0xffBBC3CE),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      dropDownAndroid(years, endYear, (val) async {
                        setState(() {
                          endYear = val;
                          loaded = false;
                        });
                        if (ownerName!.ownerName == "All") {
                          Provider.of<OwnerSearchStatsProvider>(context,
                                  listen: false)
                              .clearList();
                          for (var i in Provider.of<OwnerDataProvider>(context,
                                  listen: false)
                              .ownerList) {
                            await getOwnerStats(i.uid!, startYear, context);
                          }
                        } else {
                          Provider.of<OwnerSearchStatsProvider>(context,
                                  listen: false)
                              .clearList();
                          await getOwnerStats(
                              ownerName!.uid!, startYear, context);
                        }
                        setState(() {
                          loaded = true;
                        });
                      }),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Branches',
                style: TextStyle(
                    color: Color(0xffBBC3CE),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              dropDownAndroidOwner(ownerNames, ownerName!, (val) async {
                setState(() {
                  ownerName = val;
                  loaded = false;
                });
                if (val.ownerName == "All") {
                  Provider.of<OwnerSearchStatsProvider>(context, listen: false)
                      .clearList();
                  for (var i
                      in Provider.of<OwnerDataProvider>(context, listen: false)
                          .ownerList) {
                    await getOwnerStats(i.uid!, startYear, context);
                  }
                } else {
                  Provider.of<OwnerSearchStatsProvider>(context, listen: false)
                      .clearList();
                  await getOwnerStats(val.uid!, startYear, context);
                }
                setState(() {
                  loaded = true;
                });
              }),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Search Results",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: Consumer<OwnerSearchStatsProvider>(
                  builder: (context, data, _) {
                    return data.dataList.isNotEmpty
                        ? ListView.builder(
                            itemCount: data.dataList.length,
                            itemBuilder: (context, index) {
                              return SearchedCard(
                                data: data.dataList[index],
                              );
                            })
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                !loaded
                                    ? CircularProgressIndicator()
                                    : Text(" "),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  loaded
                                      ? "No search results"
                                      : "Retrieving data...",
                                  style: TextStyle(
                                      color: myColor.shade50.withOpacity(0.5),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
