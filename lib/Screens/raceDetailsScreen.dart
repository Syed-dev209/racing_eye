import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/raceDetailsController.dart';
import 'package:racing_eye/Models/raceDescModel.dart';
import 'package:racing_eye/Models/raceRunnersModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/somethingWentWrong.dart';
import 'package:racing_eye/Services/internet_connection.dart';
import 'package:racing_eye/main.dart';

import 'Components/raceDetailInfoCard.dart';
import 'Components/raceDetailsCard.dart';

class RaceDetailsScreen extends StatefulWidget {
  String? raceId;
  int index;
  RaceDetailsScreen({required this.raceId, required this.index});

  @override
  _RaceDetailsScreenState createState() => _RaceDetailsScreenState();
}

class _RaceDetailsScreenState extends State<RaceDetailsScreen> {
  bool loaded = false;
  bool loaded2 = false;
  bool error = false;
  StreamController<List<RaceRunnersModel>?>? runnersController;

  getRaceData(context) async {
    bool check = await InternetService.checkConnectivity();
    if (check) {
      if (widget.raceId != null) {
        await getRaceDescription(context: context, raceId: widget.raceId!)
            .then((value) {
          setState(() {
            loaded2 = true;
          });
        });
        await getRaceRunner(context, widget.raceId!).then((value) {
          if (value != null) {
            runnersController!.add(value);
            return value;
          } else {
            runnersController!.add(null);
            return null;
          }
        });
        setState(() {
          loaded = true;
        });
      } else {
        setState(() {
          loaded = true;
          error = false;
        });
      }
    } else {
      error = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    runnersController = StreamController<List<RaceRunnersModel>>();
    getRaceData(context);
  }

  @override
  void dispose() {
    runnersController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomWhiteAppBar(
          headerText: "Race Details/Results",
          showTrailing: false,
        ),
        body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                children: [
                  !error
                      ? Expanded(
                          child: Consumer<RaceResultsProvider>(
                              builder: (context, data, child) {
                            return Column(
                              children: [
                                loaded2
                                    ? RaceDetailsInfoCard(
                                        data: data.raceData[0],
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Expanded(
                                    child:
                                        StreamBuilder<List<RaceRunnersModel>?>(
                                  stream: runnersController!.stream,
                                  builder: (context, data) {
                                    if (!data.hasError &&
                                        data.connectionState ==
                                            ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    if (data.data == null) {
                                      return SomethingWrongWidget(onReload: () {
                                        getRaceData(context);
                                      });
                                    }

                                    if (data.data!.isEmpty) {
                                      return Center(
                                        child: Text(
                                          "No runner",
                                          style: TextStyle(
                                              color: myColor.shade50
                                                  .withOpacity(0.6),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    }

                                    List<RaceRunnersModel> dataList =
                                        sortList(data.data!);

                                    return data.data!.isNotEmpty
                                        ? ListView.builder(
                                            itemCount: dataList.length,
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 15.0),
                                                child: RaceDetailsCard(
                                                  index: i + 1,
                                                  runnerData: dataList[i],
                                                ),
                                              );
                                            })
                                        : Center(
                                            child: Text(
                                              "No race runners",
                                              style: TextStyle(
                                                  color: myColor.shade50
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          );
                                  },
                                )),
                              ],
                            );
                          }),
                        )
                      : SomethingWrongWidget(onReload: () {
                          setState(() {
                            error = false;
                          });
                          getRaceData(context);
                        })
                  // : Container(
                  //     height: MediaQuery.of(context).size.height * 0.8,
                  //     width: double.maxFinite,
                  //     child: Center(child: CircularProgressIndicator())),
                ],
              )
              // : Text(
              //     "No details",
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold),
              //   ),
              ),
        ),
      ),
    );
  }

  List<RaceRunnersModel> sortList(List<RaceRunnersModel> data) {
    if (widget.index == 2) {
      for (int i = 0; i < data.length; i++) {
        for (int j = i; j < data.length; j++) {
          if (data[i].winningPosition! > data[j].winningPosition!) {
            var temp = data[j];
            data[j] = data[i];
            data[i] = temp;
          }
        }
      }
    } else {
      for (int i = 0; i < data.length; i++) {
        for (int j = i; j < data.length; j++) {
          if (data[i].startNumber! > data[j].startNumber!) {
            var temp = data[j];
            data[j] = data[i];
            data[i] = temp;
          }
        }
      }
    }

    return data;
  }
}
