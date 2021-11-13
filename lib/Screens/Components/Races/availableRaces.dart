import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';

import '../raceCard.dart';

class AvailableRaces extends StatefulWidget {
  const AvailableRaces({Key? key}) : super(key: key);

  @override
  _AvailableRacesState createState() => _AvailableRacesState();
}

class _AvailableRacesState extends State<AvailableRaces> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AvailableRaceProvider>(builder: (context, data, _) {
      return data.availRaces.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
              child: ListView.builder(
                  itemCount: data.availRaces.length,
                  itemBuilder: (context, index) {
                    return RacesCard(
                      dataModel: data.availRaces[index],
                    );
                  }),
            )
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  height: size.height * 0.2,
                  width: double.maxFinite,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          "images/noRaces2.png",
                          height: 140,
                        ),
                      ),
                      // SizedBox(
                      //   height: 55.0,
                      // ),
                      Text(
                        "No Available Races",
                        style:
                            TextStyle(color: Color(0xff848484), fontSize: 18.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: double.maxFinite,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upcoming Races',
                        style: TextStyle(
                            fontSize: 19.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Expanded(
                        child: Consumer<UpcomingRaceProvider>(
                          builder: (context, data, _) {
                            return ListView.builder(
                                itemCount: data.comingRaces.length,
                                itemBuilder: (context, index) {
                                  return RacesCard(
                                    dataModel: data.comingRaces[index],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
    });
  }
}
