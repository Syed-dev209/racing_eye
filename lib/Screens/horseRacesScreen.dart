import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/raceCard.dart';
import 'package:racing_eye/main.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
          child: Column(
            children: [
              CustomWhiteAppBar(
                headerText: 'Horse Races',
                showTrailing: false,
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
                    controller: _tabController,
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
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    AvailableRaces(),
                    UpcomingRaces(),
                    CompletedRaces(),
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

class AvailableRaces extends StatefulWidget {
  const AvailableRaces({Key? key}) : super(key: key);

  @override
  _AvailableRacesState createState() => _AvailableRacesState();
}

class _AvailableRacesState extends State<AvailableRaces> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return RacesCard();
        });
  }
}

class UpcomingRaces extends StatefulWidget {
  const UpcomingRaces({Key? key}) : super(key: key);

  @override
  _UpcomingRacesState createState() => _UpcomingRacesState();
}

class _UpcomingRacesState extends State<UpcomingRaces> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return RacesCard();
        });
  }
}

class CompletedRaces extends StatefulWidget {
  const CompletedRaces({Key? key}) : super(key: key);

  @override
  _CompletedRacesState createState() => _CompletedRacesState();
}

class _CompletedRacesState extends State<CompletedRaces> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Filter',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),
            ),
            Container(
              height: 35.0,
              width: 120.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10.0)),
            )
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return RacesCard();
                }))
      ],
    );
  }
}
