import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';

import 'Components/raceDetailInfoCard.dart';
import 'Components/raceDetailsCard.dart';

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
              CustomWhiteAppBar(
                headerText: "Race Details/Results",
                showTrailing: false,
              ),
              SizedBox(
                height: 25,
              ),
              RaceDetailsInfoCard(),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: RaceDetailsCard(),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
