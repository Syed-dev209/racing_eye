import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:racing_eye/Screens/dashboardScreen.dart';
import 'package:racing_eye/Screens/searchScreen.dart';

class DashboardBase extends StatefulWidget {
  const DashboardBase({Key? key}) : super(key: key);

  @override
  _DashboardBaseState createState() => _DashboardBaseState();
}

class _DashboardBaseState extends State<DashboardBase> {
  int selectedIndex = 0;
  Widget? pageSelector;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageSelector = DashboardScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //elevation: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedLabelStyle: TextStyle(color: Color(0xFF02458A)),
        selectedItemColor: Color(0xFF02458A),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 0
                    ? "images/SVGS/dashboardActive.svg"
                    : "images/SVGS/dashboardInac.svg",
                height: 20,
              )
              // Image.asset(
              //   selectedIndex == 0 ? "images/dashAc.png" : "images/dashNac.png",
              //   height: 20.0,
              // )
              ,
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 1
                    ? 'images/SVGS/racingActive.svg'
                    : 'images/SVGS/racingInac.svg',
                height: 20.0,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 2
                    ? 'images/SVGS/resultActivwe.svg'
                    : 'images/SVGS/resultInac.svg',
                height: 20.0,
              ),
              label: 'Results'),
          // BottomNavigationBarItem(
          //     icon: Image.asset(
          //       selectedIndex == 3
          //           ? 'images/topPredictorsAc.png'
          //           : 'images/topPredictorsNac.png',
          //       height: 20.0,
          //     ),
          //     label: 'Top Predictors'),
          // BottomNavigationBarItem(
          //     icon: Image.asset(
          //       selectedIndex == 4
          //           ? 'images/settingsAc.png'
          //           : 'images/settingsNac.png',
          //       height: 18.0,
          //     ),
          //     label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              pageSelector = DashboardScreen();
            } else if (index == 1) {
              pageSelector = SearchScreen();
            }
            selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: pageSelector!,
      ),
    );
  }
}
