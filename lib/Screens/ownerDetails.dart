import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModel/bigRaceWins.dart';
import 'package:racing_eye/Models/OwnerModel/horseModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/OwnerModel/ownerEntriesModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerLast14Days.dart';
import 'package:racing_eye/Models/OwnerModel/statsSummary.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerTables.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerCard.dart';
import 'package:racing_eye/Screens/Components/somethingWentWrong.dart';
import 'package:racing_eye/Services/internet_connection.dart';

String netAmount = "0.00";

class OwnerDetails extends StatefulWidget {
  OwnersData ownerData;
  OwnerDetails({required this.ownerData});

  @override
  _OwnerDetailsState createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  updateNetAmount(String newAmm) {
    setState(() {
      netAmount = newAmm;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    netAmount = "0.00";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomWhiteAppBar(
          headerText: 'Branch Details',
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            height: MediaQuery.of(context).size.height * 0.964,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                OwnerCard(
                  ownerData: widget.ownerData,
                  bgColorWhite: false,
                  netAmount: netAmount,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: OwnerDataTable(
                  refreshAmount: updateNetAmount,
                  ownersData: widget.ownerData,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OwnerDataTable extends StatefulWidget {
  OwnersData ownersData;
  Function refreshAmount;
  OwnerDataTable({required this.ownersData, required this.refreshAmount});
  @override
  _OwnerDataTableState createState() => _OwnerDataTableState();
}

class _OwnerDataTableState extends State<OwnerDataTable>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [
    Tab(
      text: " Form",
    ),
    Tab(
      text: " Entries",
    ),
    Tab(
      text: " Horses",
    ),
    Tab(
      text: " Stats",
    ),
  ];
  TabController? controller;
  List<OwnerLast14Days> formList = [];
  List<OwnerEntries>? entriesList = [];
  List<HorseModel> horseList = [];
  List<StatsSummary>? statsList = [];
  List<BigRaceWinsModel>? raceList = [];
  bool error = false;

  generateLists() async {
    bool check = await InternetService.checkConnectivity();
    if (check) {
      await getOwnerLast14DaysData(widget.ownersData.uid!).then((value) async {
        if (value != null) {
          setState(() {
            formList.addAll(value);
            for (int i = 0; i < formList.length; i++) {
              formList[i].index = i;
            }
          });
          await getOwnerEntries(widget.ownersData.uid!).then((value) async {
            if (value != null) {
              setState(() {
                entriesList!.addAll(value);
                for (int i = 0; i < entriesList!.length; i++) {
                  entriesList![i].index = i;
                }
              });
              await getOwnerHorses(widget.ownersData.uid!).then((value) async {
                if (value != null) {
                  setState(() {
                    horseList.addAll(value);
                    for (int i = 0; i < horseList.length; i++) {
                      horseList[i].index = i;
                    }
                  });
                  await getOwnerStatsSummary(widget.ownersData.uid!)
                      .then((value) async {
                    if (value != null) {
                      setState(() {
                        statsList!.addAll(value);

                        if (statsList != null) {
                          for (int i = 0; i < statsList!.length; i++) {
                            // statsList![i].index = i;
                            widget.refreshAmount(
                                statsList![i].earnings.toString());
                          }
                        }
                      });
                      await getOwnerBigRaceWins(widget.ownersData.uid!)
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            raceList!.addAll(value);
                            for (int i = 0; i < raceList!.length; i++) {
                              raceList![i].index = i;
                            }
                          });
                        } else {
                          error = true;
                        }
                      });
                    } else {
                      error = true;
                    }
                  });
                } else {
                  error = true;
                }
              });
            } else {
              error = true;
            }
          });
        } else {
          error = true;
        }
      });
    } else {
      error = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateLists();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !error
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    height: 40.0,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Color(0xffD8E2EE),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TabBar(
                      //physics: NeverScrollableScrollPhysics(),
                      tabs: tabs,
                      controller: controller,
                      unselectedLabelColor: Color(0xFF02458A),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                      labelColor: Colors.white,
                      //  indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.zero,
                      indicator: BubbleTabIndicator(
                        indicatorRadius: 20.0,
                        indicatorHeight: 35.0,
                        indicatorColor: Color(0xFF02458A),
                        // tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      ),
                    )),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      OwnerDataTables(
                          dataTable: FormDataTable(
                        ownerId: widget.ownersData.uid!,
                        list: formList,
                      )),
                      OwnerDataTables(
                          dataTable: EntriesDataTable(
                        ownerId: widget.ownersData.uid!,
                        list: entriesList,
                      )),
                      OwnerDataTables(
                          dataTable: HorsesDataTable(
                        ownerId: widget.ownersData.uid!,
                        list: horseList,
                      )),
                      OwnerDataTables(
                        dataTable: StatsDataTable(
                          statsList: statsList,
                          raceLists: raceList,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : SomethingWrongWidget(onReload: () {
              setState(() {
                error = false;
              });
              generateLists();
            }),
    );
  }
}

const monthList = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
