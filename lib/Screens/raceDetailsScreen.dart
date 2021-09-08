import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/main.dart';

class RaceDetailsScreen extends StatefulWidget {
  const RaceDetailsScreen({Key? key}) : super(key: key);

  @override
  _RaceDetailsScreenState createState() => _RaceDetailsScreenState();
}

class _RaceDetailsScreenState extends State<RaceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              CustomWhiteAppBar(headerText: "Race Details/Results"),
              Container(
                height: 200.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: myColor.shade50,
                    borderRadius: BorderRadius.circular(18.0)),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sharjah",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                "images/timeCircle.png",
                                height: 15,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "19:00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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
