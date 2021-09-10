import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/raceDetailsController.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';

import 'Components/raceDetailInfoCard.dart';
import 'Components/raceDetailsCard.dart';

class RaceDetailsScreen extends StatefulWidget {
  String raceId;
  RaceDetailsScreen({required this.raceId});

  @override
  _RaceDetailsScreenState createState() => _RaceDetailsScreenState();
}

class _RaceDetailsScreenState extends State<RaceDetailsScreen> {
  bool loaded = false;
  getRaceData(context) async {
    await getRaceDescription(context: context, raceId: widget.raceId);
    await getRaceRunner(context, widget.raceId);
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getRaceData(context);
  }

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
              loaded
                  ? Expanded(
                      child: Column(
                        children: [
                          RaceDetailsInfoCard(
                            data: Provider.of<RaceResultsProvider>(context,
                                    listen: false)
                                .raceData!,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Expanded(child: Consumer<RaceResultsProvider>(
                              builder: (context, data, child) {
                            return ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 15.0),
                                    child: RaceDetailsCard(),
                                  );
                                });
                          }))
                        ],
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: double.maxFinite,
                      child: Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
