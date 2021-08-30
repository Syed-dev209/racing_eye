import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/dashboardBase.dart';
import 'package:racing_eye/Screens/loginScreen.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import 'package:racing_eye/Screens/ownerList.dart';
import 'package:racing_eye/Screens/password_recovery.dart';
import 'package:racing_eye/Screens/register_screen.dart';

import 'Models/OwnerModels/ownerData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

const MaterialColor myColor = const MaterialColor(0xFF02458A, <int, Color>{
  50: Color(0xFF02458A),
  100: Color(0xFF02458A),
  200: Color(0xFF02458A),
  300: Color(0xFF02458A),
  400: Color(0xFF02458A),
  500: Color(0xFF02458A),
  600: Color(0xFF02458A),
  700: Color(0xFF02458A),
  800: Color(0xFF02458A),
  900: Color(0xFF02458A)
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Racing Eye',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: DashboardBase(),
    );
  }
}
// OwnerDetails(ownerData: OwnersData(
// id: 1,
// uid: 302438,
// ownerName: "SHADWELL ESTATE COMPANY LTD",
// ptpTypeCode: "N",
// silk: " ",
// styleName: "Shadwell Estate Company Ltd",
// silkImagePath: "8/3/4/302438",
// createdAt: "2021-08-24 12:23:00",
// updatedAt: "2021-08-24 12:23:00"
// ),
// )
