import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/allHorsesController.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/horseDetailCard.dart';

import 'Components/HorseComponents/horseDataTables.dart';

class RaceRunnerDetailScreen extends StatefulWidget {
  String horseId;
  RaceRunnerDetailScreen({required this.horseId});

  @override
  _RaceRunnerDetailScreenState createState() => _RaceRunnerDetailScreenState();
}

class _RaceRunnerDetailScreenState extends State<RaceRunnerDetailScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [
    Tab(
      text: " Form",
    ),
    // Tab(
    //   text: " Entries",
    // ),
    // Tab(
    //   text: " Sales",
    // ),
  ];
  TabController? controller;
  bool loaded1 = false;
  bool loaded5 = false;
  bool loaded3 = false;
  bool loaded4 = false;

  getData() async {
    getAllHorseData(context, widget.horseId).then((value) {
      setState(() {
        loaded1 = true;
        loaded5 = true;
        loaded3 = true;
        loaded4 = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
    getData();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomWhiteAppBar(
          headerText: "Horse Details",
          showTrailing: true,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.98,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      loaded1
                          ? HorseDetailsCard(
                              expand: true,
                              //data: Provider.of<HorseProfileProvider>(context, listen: false)
                              // .profile!,
                            )
                          : Center(
                              child: Container(
                                height: 100.0,
                                width: double.maxFinite,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 25.0,
                      ),
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
                            loaded3
                                ? HorseDataTables(
                                    dataTable: HorseFormDataTable(
                                      showUpper: false,
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      height: 500.0,
                                      width: double.maxFinite,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                            // loaded5
                            //     ? HorseDataTables(
                            //   dataTable: HorseEntriesDataTable(),
                            // )
                            //     : Center(
                            //   child: Container(
                            //     height: 500.0,
                            //     width: double.maxFinite,
                            //     child: Center(
                            //       child: CircularProgressIndicator(),
                            //     ),
                            //   ),
                            // ),
                            // loaded4
                            //     ? HorseDataTables(
                            //   dataTable: HorseSalesDataTable(),
                            // )
                            //     : Center(
                            //   child: Container(
                            //     height: 500.0,
                            //     width: double.maxFinite,
                            //     child: Center(
                            //       child: CircularProgressIndicator(),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                // : Center(
                //     child: Container(
                //       height: 500.0,
                //       width: double.maxFinite,
                //       child: Center(
                //         child: CircularProgressIndicator(),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
