import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:racing_eye/Controller/allHorsesController.dart';
import 'package:racing_eye/Controller/notificationController.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Controller/statsController.dart';
import 'package:racing_eye/Screens/dashboardBase.dart';
import 'package:racing_eye/Screens/loginScreen.dart';
import 'package:racing_eye/main.dart';

import 'introRaceScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  loadData() async {
    await getStatus(context).then((value) async {
      await getAllHorsesData(context).then((value) async {
        await getAllOwnerList(context).then((value) {
          final box = GetStorage();
          bool check = box.read("login") ?? false;
          if (check) {
            Navigator.pushReplacement(
                context, CupertinoPageRoute(builder: (_) => DashboardBase()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => IntroRaceScreen()));
          }
        });
      });
    });
  }

  PushNotificationServices? notificationServices;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    notificationServices = PushNotificationServices();
    notificationServices!.initializeNotifications();
    notificationServices!.getDeviceToken();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.shade50,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          color: myColor.shade50,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/appIcon.png',
                  //height: 90.0,
                ),
                SizedBox(
                  height: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    // SizedBox(
                    //   width: 30.0,
                    // ),
                    // Expanded(
                    //   child: Text(
                    //     "Please wait while we setup things for you...",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 20.0),
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
