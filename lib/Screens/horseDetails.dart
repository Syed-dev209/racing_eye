import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/horseDetailCard.dart';
import 'package:racing_eye/main.dart';

class HorseDetails extends StatefulWidget {
  const HorseDetails({Key? key}) : super(key: key);

  @override
  _HorseDetailsState createState() => _HorseDetailsState();
}

class _HorseDetailsState extends State<HorseDetails>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [
    Tab(
      text: " Form",
    ),
    Tab(
      text: " Entries",
    ),
    Tab(
      text: " Sales",
    ),
  ];
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              CustomWhiteAppBar(
                headerText: "Horse Details",
                showTrailing: true,
              ),
              SizedBox(
                height: 25.0,
              ),
              HorseDetailsCard(),
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
                    Text("Form"),
                    Text("Entries"),
                    Text("Sales"),
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
