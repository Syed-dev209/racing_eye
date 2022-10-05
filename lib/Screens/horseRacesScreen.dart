import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/raceDetailsController.dart';
import 'package:racing_eye/Screens/Components/Races/availableRaces.dart';
import 'package:racing_eye/Screens/Components/Races/completedRaces.dart';
import 'package:racing_eye/Screens/Components/Races/upcomingRaces.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/somethingWentWrong.dart';
import 'package:racing_eye/Services/internet_connection.dart';
// import 'package:racing_eye/Screens/Components/raceCard.dart';
// import 'package:racing_eye/main.dart';

class HorseRaceScreen extends StatefulWidget {
  const HorseRaceScreen({Key? key}) : super(key: key);

  @override
  _HorseRaceScreenState createState() => _HorseRaceScreenState();
}

class _HorseRaceScreenState extends State<HorseRaceScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [
    Tab(
      text: "Available",
    ),
    Tab(
      text: "Upcoming",
    ),
    Tab(
      text: "Completed",
    )
  ];

  TabController? _tabController;
  bool loaded = false;
  bool loaded2 = false;
  bool loaded3 = false;
  bool error = false;
  getRaceDetails() async {
    bool check = await InternetService.checkConnectivity();
    if (check) {
      getAvailableRaces(context).then((value) {
        if (value != null) {
          loaded = true;
        } else {
          error = true;
        }
      });
      getUpcomingRaces(context).then((value) {
        if (value != null) {
          loaded2 = true;
        } else {
          error = true;
        }
      });

      await getCompletedRaces(context).then((value) {
        if (value != null) {
          loaded3 = true;
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
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getRaceDetails();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomWhiteAppBar(
          headerText: 'Horse Races',
          showTrailing: false,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.98,
            width: double.maxFinite,
            //padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
            child: !error
                ? Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            height: 40.0,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Color(0xffD8E2EE),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: TabBar(
                              tabs: tabs,
                              controller: _tabController,
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
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            loaded
                                ? AvailableRaces()
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                            loaded2
                                ? UpcomingRaces()
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                            loaded3
                                ? CompletedRaces()
                                : Center(
                                    child: CircularProgressIndicator(),
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
                    getRaceDetails();
                  }),
          ),
        ),
      ),
    );
  }
}
