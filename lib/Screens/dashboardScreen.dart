import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/statsModel.dart';
import 'package:racing_eye/Screens/dashboardBase.dart';
import 'package:racing_eye/Screens/horseRacesScreen.dart';
import 'package:racing_eye/Screens/horsesList.dart';
import 'package:racing_eye/Screens/ownerList.dart';
import 'package:racing_eye/Screens/searchScreen.dart';

import 'Components/Dashboard/dashboardContentCard.dart';
import 'Components/Dashboard/dashboardStatsCard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final format = NumberFormat.simpleCurrency(name: "GBP");
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8936,
      width: MediaQuery.of(context).size.width,
      color: Color(0xff02468D),
      child: SingleChildScrollView(child: Consumer<StatsProvider>(
        builder: (context, data, _) {
          return Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: Image.asset(
                  'images/eyeLogo2.png',
                  height: 30.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DashboardStatsCard(
                        title: "Year",
                        value: data.data!.year!,
                      ),
                    ),
                    Expanded(
                        child: DashboardStatsCard(
                      title: "Win",
                      value: data.data!.wins!,
                    )),
                    Expanded(
                      child: DashboardStatsCard(
                        title: "Runs",
                        value: data.data!.runs!,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DashboardStatsCard(
                        title: "Win%",
                        value: "${data.data!.percentWinsRuns!}%",
                      ),
                    ),
                    Expanded(
                      child: DashboardStatsCard(
                        title: "Total Earnings",
                        value:
                            format.format(double.parse(data.data!.earnings!)),
                      ),
                    ),
                    Expanded(
                        child: DashboardStatsCard(
                      title: "Stake",
                      value: format.format(double.parse(data.data!.stake!)),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.495,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0))),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          DashboardContentCard(
                            title: "Owners",
                            imagePath: "images/owners.png",
                            goToPage: OwnerList(),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          DashboardContentCard(
                            title: "Card/Results",
                            imagePath: "images/resultsCard.png",
                            goToPage: HorseRaceScreen(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          DashboardContentCard(
                            title: "Statistics",
                            imagePath: "images/statistics.png",
                            goToPage: SearchScreen(),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          DashboardContentCard(
                            title: "Horses",
                            imagePath: "images/horses.png",
                            goToPage: HorsesList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
