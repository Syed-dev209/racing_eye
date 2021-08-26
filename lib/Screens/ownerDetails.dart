import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/indicator/standard_indicator.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModels/OwnerFormDataTableModel.dart';
import 'package:racing_eye/Models/OwnerModels/bigRaceWins.dart';
import 'package:racing_eye/Models/OwnerModels/horseModel.dart';
import 'package:racing_eye/Models/OwnerModels/ownerData.dart';
import 'package:racing_eye/Models/OwnerModels/ownerEntriesModel.dart';
import 'package:racing_eye/Models/OwnerModels/ownerLast14Days.dart';
import 'package:racing_eye/Models/OwnerModels/statsSummary.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerTables.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerCard.dart';

class OwnerDetails extends StatefulWidget {
  OwnersData ownerData;
  OwnerDetails({required this.ownerData});

  @override
  _OwnerDetailsState createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          height: MediaQuery.of(context).size.height * 0.964,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CustomWhiteAppBar(
                headerText: 'Owner Details',
              ),
              SizedBox(
                height: 15.0,
              ),
              // Container(
              //   padding: EdgeInsets.only(
              //       left: 25.0, right: 10.0, top: 15.0, bottom: 15.0),
              //   height: 90.0,
              //   width: double.maxFinite,
              //   decoration: BoxDecoration(
              //       color: Color(0xff02468D),
              //       borderRadius: BorderRadius.circular(20.0)),
              //   child: Row(children: [
              //     ImagePlaceHolder(
              //       imagePath: "https://www.rp-assets.com/png_silks/${widget.ownerData.silkImagePath}.png",
              //     ),
              //     SizedBox(
              //       width: 15.0,
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         SizedBox(
              //           height: 2.0,
              //         ),
              //         Text(
              //           widget.ownerData.ownerName!,
              //           style: TextStyle(color: Colors.white, fontSize: 18.0),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             Image.asset(
              //               'images/cup.png',
              //             ),
              //             SizedBox(
              //               width: 8.0,
              //             ),
              //             Text(
              //               'AED 0.00',
              //               style: TextStyle(
              //                   color: Color(0xff6790BB), fontSize: 15.0),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 2.0,
              //         )
              //       ],
              //     ),
              //     SizedBox(
              //       width: 53.0,
              //     ),
              //     Align(
              //       alignment: Alignment.topRight,
              //       child: CircleAvatar(
              //         radius: 17.0,
              //         backgroundColor: Colors.white,
              //         backgroundImage: NetworkImage(
              //             'https://www.publicdomainpictures.net/pictures/350000/velka/uae-flag.jpg'),
              //       ),
              //     )
              //   ]),
              // ),
              OwnerCard(
                ownerData: widget.ownerData,
                bgColorWhite: false,
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                  child: OwnerDataTable(
                ownersData: widget.ownerData,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class OwnerDataTable extends StatefulWidget {
  OwnersData ownersData;
  OwnerDataTable({required this.ownersData});
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
  List<Last14Days> formList = [];
  List<Entries>? entriesList = [];
  List<Horses> horseList = [];
  List<StatisticalSummary>? statsList = [];
  List<BigRaceWin>? raceList = [];

  generateLists() async {
    await getOwnerLast14DaysData(widget.ownersData.uid!).then((value) async {
      if (value != null) {
        setState(() {
          formList = value.data!.last14Days!;
          for (int i = 0; i < formList.length; i++) {
            formList[i].index = i;
          }
        });
        await getOwnerEntries(widget.ownersData.uid!).then((value) async {
          if (value != null) {
            setState(() {
              entriesList = value.data!.entries;
              for (int i = 0; i < entriesList!.length; i++) {
                entriesList![i].index = i;
              }
            });
            await getOwnerHorses(widget.ownersData.uid!).then((value) async {
              if (value != null) {
                setState(() {
                  horseList = value.data!.horses!;
                  for (int i = 0; i < horseList.length; i++) {
                    horseList[i].index = i;
                  }
                });
                await getOwnerStatsSummary(widget.ownersData.uid!)
                    .then((value) async {
                  if (value != null) {
                    print(value);
                    setState(() {
                      statsList = value.data!.statisticalSummary;
                      print(statsList);
                      if (statsList != null) {
                        for (int i = 0; i < statsList!.length; i++) {
                          statsList![i].index = i;
                        }
                      }
                    });
                    await getOwnerBigRaceWins(widget.ownersData.uid!)
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          raceList = value.data!.bigRaceWins!;
                          print("Race Lis $raceList}");
                          for (int i = 0; i < raceList!.length; i++) {
                            raceList![i].index = i;
                          }
                        });
                      }
                    });
                  }
                });
              }
            });
          }
        });
      }
    });
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
      child: Column(
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
                tabs: tabs,
                controller: controller,
                unselectedLabelColor: Color(0xFF02458A),
                unselectedLabelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
