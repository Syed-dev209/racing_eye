import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Screens/Components/raceCard.dart';

class UpcomingRaces extends StatefulWidget {
  const UpcomingRaces({Key? key,}) : super(key: key);

  @override
  _UpcomingRacesState createState() => _UpcomingRacesState();
}

class _UpcomingRacesState extends State<UpcomingRaces> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingRaceProvider>(builder: (context, data, _) {
      return ListView.builder(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
          itemCount: data.comingRaces.length,
          itemBuilder: (context, index) {
            return RacesCard(
              index: 1,
              dataModel: data.comingRaces[index],
            );
          });
    });
  }
}
