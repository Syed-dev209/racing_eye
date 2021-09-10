import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/raceDetailsController.dart';
import 'package:racing_eye/Screens/Components/Races/availableRaces.dart';
import 'package:racing_eye/Screens/Components/Races/completedRaces.dart';
import 'package:racing_eye/Screens/Components/Races/upcomingRaces.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
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

  getRaceDetails() async {
    await getAvailableRaces(context);
    await getUpcomingRaces(context);
    await getCompletedRaces(context);
    setState(() {
      loaded = true;
    });
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          //padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
                child: CustomWhiteAppBar(
                  headerText: 'Horse Races',
                  showTrailing: false,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
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
                    loaded
                        ? UpcomingRaces()
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    loaded
                        ? CompletedRaces()
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
