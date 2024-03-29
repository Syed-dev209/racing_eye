import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:racing_eye/Controller/allHorsesController.dart';
import 'package:racing_eye/Controller/notificationController.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Controller/statsController.dart';
import 'package:racing_eye/Screens/Components/somethingWentWrong.dart';
import 'package:racing_eye/Screens/dashboardBase.dart';
import 'package:racing_eye/Services/internet_connection.dart';
import 'package:racing_eye/main.dart';
import 'dart:io' show Platform;

import 'introRaceScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  bool loggedIn = false;
  bool error = false;
  loadData() async {
    await getStatus(context).then((value) async {
      await getAllHorsesData(context).then((value) async {
        await getAllOwnerList(context).then((value) {
          bool check = box.read("login") ?? false;
          //Provider.of<LoginChecker>(context, listen: false).setUserStatus = check;
          loggedIn = check;
          if (check) {
            Navigator.pushReplacement(
                context, CupertinoPageRoute(builder: (_) => DashboardBase()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => IntroRaceScreen()));
          }
        });
      });
    }).then((value) {
      notificationServices!.initializeNotifications(context, loggedIn);
    });
  }

  checkToken() async {
    bool check = box.read("token") ?? false;

    if (!check) {
      String token = await notificationServices!.getDeviceToken();
      await registerDeviceToken(token, Platform.isAndroid ? "android" : "ios");
    }
  }

  PushNotificationServices? notificationServices;

  initializeApp() {
    InternetService.checkConnectivity().then((value) {
      if (value) {
        notificationServices!.requestPermission();
        checkToken();
        loadData();
      } else {
        setState(() {
          error = true;
        });
      }
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    notificationServices = PushNotificationServices();
    initializeApp();
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
          child: !error
              ? Center(
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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : SomethingWrongWidget(onReload: () {
                  setState(() {
                    error = false;
                  });
                  initializeApp();
                }),
        ),
      ),
    );
  }
}
