import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/main.dart';

class PushNotificationServices {
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<String> getDeviceToken() async {
    String? token = await _fcm.getToken();
    print("Device Token:- $token");
    return token ?? "";
  }

  initializeNotifications() {
    _fcm.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showOverlayNotification((context) {
          return Card(
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
          );
        }, duration: Duration(milliseconds: 2000));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');

      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });
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
