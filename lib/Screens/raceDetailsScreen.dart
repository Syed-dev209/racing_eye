import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/raceDetailsController.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/main.dart';

import 'Components/raceDetailInfoCard.dart';
import 'Components/raceDetailsCard.dart';

class RaceDetailsScreen extends StatefulWidget {
  String? raceId;
  RaceDetailsScreen({required this.raceId});

  @override
  _RaceDetailsScreenState createState() => _RaceDetailsScreenState();
}

class _RaceDetailsScreenState extends State<RaceDetailsScreen> {
  bool loaded = false;
  bool error = false;

  getRaceData(context) async {
    print(widget.raceId ?? "hhbfsd,fdbn");
    if (widget.raceId != null) {
      await getRaceDescription(context: context, raceId: widget.raceId!);
      await getRaceRunner(context, widget.raceId!);
      setState(() {
        loaded = true;
      });
    } else {
      setState(() {
        loaded = true;
        error = false;
      });
    }
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
          child: !error
              ? Column(
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
                            child: Consumer<RaceResultsProvider>(
                                builder: (context, data, child) {
                              if (data.raceData == null ||
                                  data.runners!.data == null) {
                                return Center(
                                  child: Text(
                                    "No details",
                                    style: TextStyle(
                                        color: myColor.withOpacity(0.6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                              return Column(
                                children: [
                                  RaceDetailsInfoCard(
                                    data: data.raceData!,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: data.runners!.data!.runners!
                                            .data.length,
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 15.0),
                                            child: RaceDetailsCard(
                                              index: i + 1,
                                              runnerData: data.runners!.data!
                                                  .runners!.data[i],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              );
                            }),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: double.maxFinite,
                            child: Center(child: CircularProgressIndicator())),
                  ],
                )
              : Text(
                  "No details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
