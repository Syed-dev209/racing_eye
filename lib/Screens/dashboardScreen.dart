import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/dashboardBase.dart';
import 'package:racing_eye/Screens/horsesList.dart';
import 'package:racing_eye/Screens/ownerList.dart';

import 'Components/Dashboard/dashboardContentCard.dart';
import 'Components/Dashboard/dashboardStatsCard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8936,
      width: MediaQuery.of(context).size.width,
      color: Color(0xff02468D),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                'Racing Eye',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
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
                      value: "2021",
                    ),
                  ),
                  Expanded(
                      child: DashboardStatsCard(
                    title: "Wins",
                    value: "91",
                  )),
                  Expanded(
                    child: DashboardStatsCard(
                      title: "Runs",
                      value: "300",
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
                      title: "Wins",
                      value: "20%",
                    ),
                  ),
                  Expanded(
                    child: DashboardStatsCard(
                      title: "Total Earnings",
                      value: "\$20000",
                    ),
                  ),
                  Expanded(
                      child: DashboardStatsCard(
                    title: "Stake",
                    value: "\$20",
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.48,
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
                          imagePath: "images/live.png",
                          goToPage: OwnerList(),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        DashboardContentCard(
                          title: "Card/Results",
                          imagePath: "images/resultsCard.png",
                          goToPage: DashboardBase(),
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
                          goToPage: DashboardBase(),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        DashboardContentCard(
                          title: "Horses",
                          imagePath: "images/search.png",
                          goToPage: HorsesList(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )

            // Card(
            //   color: Color(0xfff3f3f3),
            //   margin: EdgeInsets.zero,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(40.0),
            //           topLeft: Radius.circular(40.0))),
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Row(
            //           children: [
            //             DashboardContentCard(
            //               title: "Owners",
            //               imagePath: "images/live.png",
            //             ),
            //             SizedBox(
            //               width: 15.0,
            //             ),
            //             DashboardContentCard(
            //               title: "Card/Results",
            //               imagePath: "images/resultsCard.png",
            //             )
            //           ],
            //         ),
            //         SizedBox(
            //           height: 20.0,
            //         ),
            //         Row(
            //           children: [
            //             DashboardContentCard(
            //               title: "Statistics",
            //               imagePath: "images/statistics.png",
            //             ),
            //             SizedBox(
            //               width: 15.0,
            //             ),
            //             DashboardContentCard(
            //               title: "Horses",
            //               imagePath: "images/search.png",
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
