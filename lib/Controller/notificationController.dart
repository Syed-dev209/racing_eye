import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/navigatorKey.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Screens/aboutUsScreen.dart';
import 'package:racing_eye/Screens/loginScreen.dart';
import 'package:racing_eye/Screens/raceDetailsScreen.dart';
import 'package:racing_eye/main.dart';

class PushNotificationServices {
  static PushNotificationServices _pushNotificationServices =
      PushNotificationServices._internal();
  factory PushNotificationServices() {
    return _pushNotificationServices;
  }
  PushNotificationServices._internal();

  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<String> getDeviceToken() async {
    String? token = await _fcm.getToken();
    print("Device Token:- $token");
    return token ?? "";
  }

  requestPermission() {
    _fcm.requestPermission();
  }

  initializeNotifications(context, bool isLoggedIn) async {
    // bool isLoggedIn = Provider.of<LoginChecker>(context,listen: false).getUserStatus;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      ///jab app open hu
      print(message.data);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showOverlayNotification((context) {
          return GestureDetector(
            onTap: () {
              SchedulerBinding.instance!.addPostFrameCallback((_) {
                Navigator.of(GlobalVariable.navState.currentContext!).push(
                    MaterialPageRoute(
                        builder: (_) => isLoggedIn
                            ? RaceDetailsScreen(
                                raceId: message.data['raceId'].toString())
                            : LoginScreen()));
              });
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: SafeArea(
                child: ListTile(
                  leading: SizedBox.fromSize(
                    size: const Size(40, 40),
                    child: ClipOval(
                      child: Container(
                        color: myColor.shade50,
                        child: Image.asset("images/appIcon.png"),
                      ),
                    ),
                  ),
                  title: Text(notification.title!),
                  subtitle: Text(notification.body!),
                  trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        OverlaySupportEntry.of(context)!.dismiss();
                      }),
                ),
              ),
            ),
          );
        }, duration: Duration(milliseconds: 2000));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      ///jab app background me hu kill nhi hui hu
      print('A new onMessageOpenedApp event was published!');
      print(message.data);
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(GlobalVariable.navState.currentContext!).push(
            MaterialPageRoute(
                builder: (_) => isLoggedIn
                    ? RaceDetailsScreen(
                        raceId: message.data['raceId'].toString())
                    : LoginScreen()));
      });
    });

    ///when app is killed and opens on notification
    RemoteMessage? terminatedMessage = await _fcm.getInitialMessage();
    if (terminatedMessage != null) {
      if (terminatedMessage.notification != null) {
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          Navigator.of(GlobalVariable.navState.currentContext!).push(
              MaterialPageRoute(
                  builder: (_) => isLoggedIn
                      ? RaceDetailsScreen(
                          raceId: terminatedMessage.data['raceId'].toString())
                      : LoginScreen()));
        });
      }
    }
  }
}

var dio = Dio();
Future registerDeviceToken(String token, String device) async {
  try {
    String url = "https://racingeye.ae/shadwell/registertoken";
    var response = await dio.post(url,
        data: {"token": token, "device": device},
        options: Options(headers: {"Api-key": apiKey}));
    print(response.data);
    if (response.statusCode == 200) {
      final box = GetStorage();
      box.write("token", true);
    }
  } catch (e) {
    print(e);
  }
}
