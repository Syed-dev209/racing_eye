import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/statsModel.dart';
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
      height: MediaQuery.of(context).size.height * 0.89,
      width: MediaQuery.of(context).size.width,
      color: Color(0xff02468D),
      child: Consumer<StatsProvider>(
        builder: (context, data, _) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'images/appIcon.png',
                          height: 100,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: DashboardStatsCard(
                                title: "Year",
                                value: data.data!.year ?? "0.0ß",
                              ),
                            ),
                            Expanded(
                              child: DashboardStatsCard(
                                title: "Runs",
                                value: data.data!.runs ?? "0.0",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: DashboardStatsCard(
                              title: "Win",
                              value: data.data!.wins ?? "0.0",
                            )),
                            Expanded(
                              child: DashboardStatsCard(
                                title: "Win%",
                                value: "${data.data!.percentWinsRuns ?? "0"}%",
                              ),
                            ),
                            // Expanded(
                            //   child: DashboardStatsCard(
                            //     title: "Total Earnings",
                            //     value:
                            //         format.format(double.parse(data.data!.earnings!)),
                            //   ),
                            // ),
                            // Expanded(
                            //     child: DashboardStatsCard(
                            //   title: "Stake",
                            //   value: format.format(double.parse(data.data!.stake!)),
                            // )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 21.5,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  padding:
                      EdgeInsets.only(right: 25, left: 25, top: 25, bottom: 8),
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
                              title: "Branches",
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
