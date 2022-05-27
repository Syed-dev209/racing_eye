import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModel/bigRaceWins.dart';
import 'package:racing_eye/Models/OwnerModel/horseModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerEntriesModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerLast14Days.dart';
import 'package:racing_eye/Models/OwnerModel/statsSummary.dart';
import 'package:racing_eye/Screens/horseDetails.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import 'package:intl/intl.dart';
import 'package:racing_eye/Screens/raceDetailsScreen.dart';
import 'package:racing_eye/main.dart';

class OwnerDataTables extends StatefulWidget {
  Widget dataTable;

  OwnerDataTables({required this.dataTable});

  @override
  _OwnerDataTablesState createState() => _OwnerDataTablesState();
}

class _OwnerDataTablesState extends State<OwnerDataTables> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.0),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: widget.dataTable,
      ),
    );
  }
}

final formatCurrency = NumberFormat.simpleCurrency(name: "GBP");

// ignore: slash_for_doc_comments
/***************Form Table**************************************** */
class FormDataTable extends StatefulWidget {
  int ownerId;
  List<OwnerLast14Days> list = [];

  FormDataTable({required this.ownerId, required this.list});

  @override
  _FormDataTableState createState() => _FormDataTableState();
}

class _FormDataTableState extends State<FormDataTable> {
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return widget.list.isNotEmpty
        ? SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xffF3F3F3),
                  ),
                  headingRowHeight: 43.0,
                  dataRowHeight: 43.0,
                  dividerThickness: 0.0,
                  columnSpacing: 25.0,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Date',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'CRS',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'POS',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Horse',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'SP',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                  ],
                  rows: widget.list.isEmpty
                      ? [
                          DataRow(cells: [
                            DataCell(Text('No data ')),
                            DataCell(Text('No data ')),
                            DataCell(Text('No data ')),
                            DataCell(Text('No data ')),
                            DataCell(Text('No data ')),
                          ])
                        ]
                      : widget.list.map((e) {
                          if (i == 0) {
                            i = 0;
                          } else {
                            i = i + 1;
                          }
                          //e.raceDatetime = null;
                          DateTime date;
                          String month,parsedDate;
                          if(e.raceDatetime!=null){
                            date = DateTime.parse(e.raceDatetime!);
                            month = monthList[date.month - 1];
                            parsedDate = "${date.day}$month${date.year.toString().substring(2)}";
                          }else{
                            date = DateTime.now();
                            month = "N/A";
                            parsedDate = "N/A";
                          }


                          return DataRow(
                              color: MaterialStateColor.resolveWith(
                                (states) => e.index! % 2 != 0
                                    ? Color(0xffF3F3F3)
                                    : Colors.white,
                              ),
                              cells: [
                                DataCell(Text(
                                  "$parsedDate",
                                  textAlign: TextAlign.center,
                                )),
                                DataCell(Text(e.courseRpAbbrev_3.toString())),
                                DataCell(Text("${e.raceOutcomeCode!}")),
                                DataCell(Text(e.horseStyleName ?? "N/A")),
                                DataCell(Text(e.oddsDesc ?? "N/A")),
                              ]);
                        }).toList()),
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Loading...')
                ],
              ),
            ),
          );
  }
}

// ignore: slash_for_doc_comments
/***************Entries Table**************************************** */
class EntriesDataTable extends StatefulWidget {
  int ownerId;
  List<OwnerEntries>? list;

  EntriesDataTable({required this.ownerId, required this.list});

  @override
  _EntriesDataTableState createState() => _EntriesDataTableState();
}

class _EntriesDataTableState extends State<EntriesDataTable> {
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.list!.isNotEmpty
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xffF3F3F3),
                ),
                headingRowHeight: 43.0,
                dataRowHeight: 43.0,
                dividerThickness: 0.0,
                //columnSpacing: 5.0,
                horizontalMargin: 0,
                showCheckboxColumn: false,
                columns: [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Date',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Horse',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Title',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Course',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                ],
                rows: widget.list!.isNotEmpty
                    ? widget.list!.map((e) {
                        if (i == 0) {
                          i = 0;
                        } else {
                          i = i + 1;
                        }
                        DateTime date = DateTime.parse(e.raceDatetime!);
                        String month = monthList[date.month - 1];
                        return DataRow(
                            onSelectChanged: (val) {
                              if (val!) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => RaceDetailsScreen(
                                          index: 0,
                                            raceId:
                                                e.raceInstanceUid.toString())));
                              }
                            },
                            color: MaterialStateColor.resolveWith(
                              (states) => e.index! % 2 != 0
                                  ? Color(0xffF3F3F3)
                                  : Colors.white,
                            ),
                            cells: [
                              DataCell(Text(
                                "${date.day}$month${date.year.toString().substring(2)}",
                                textAlign: TextAlign.center,
                              )),
                              DataCell(Text(e.horseName!)),
                              DataCell(ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: 140, minWidth: 100),
                                child: Text(
                                  e.raceInstanceTitle.toString(),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              )),
                              DataCell(Text(e.courseStyleName!)),
                              //DataCell(Text(e.sp)),
                            ]);
                      }).toList()
                    : [
                        DataRow(
                            color: MaterialStateColor.resolveWith(
                              (states) =>
                                  i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
                            ),
                            cells: [
                              DataCell(Text("No data")),
                              DataCell(Text("No data")),
                              DataCell(Text(
                                "No data",
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )),
                              DataCell(Text("No data")),
                              //DataCell(Text(e.sp)),
                            ])
                      ]),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'No Entries were found',
                    style: TextStyle(
                        color: myColor.shade50.withOpacity(0.5),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
  }
}

////////////////////////////////////////////////////////////////////
// ignore: slash_for_doc_comments
/***************Horse Table**************************************** */
class HorsesDataTable extends StatefulWidget {
  int ownerId;
  List<HorseModel>? list;

  HorsesDataTable({required this.ownerId, required this.list});

  @override
  _HorsesDataTableState createState() => _HorsesDataTableState();
}

class _HorsesDataTableState extends State<HorsesDataTable> {
  int i = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // widget.list!.isNotEmpty
        //  ?
        SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
            (states) => Color(0xffF3F3F3),
          ),
          headingRowHeight: 43.0,
          dataRowHeight: 43.0,
          dividerThickness: 0.0,
          columnSpacing: 35.0,
          showCheckboxColumn: false,
          columns: [
            DataColumn(
              label: Text(
                'Horse',
                style: TextStyle(
                  color: Color(0xFF02458A),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Wins',
                style: TextStyle(
                  color: Color(0xFF02458A),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Runs',
                style: TextStyle(
                  color: Color(0xFF02458A),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'T.Earnings',
                style: TextStyle(
                  color: Color(0xFF02458A),
                ),
              ),
            ),
          ],
          rows: widget.list!.isNotEmpty
              ? widget.list!.map((e) {
                  i = i + 1;
                  return DataRow(
                      onSelectChanged: (val) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) =>
                                    HorseDetails(horseId: e.uid.toString())));
                      },
                      color: MaterialStateColor.resolveWith(
                        (states) => e.index! % 2 != 0
                            ? Color(0xffF3F3F3)
                            : Colors.white,
                      ),
                      cells: [
                        DataCell(Text(e.horseName!)),
                        DataCell(Text(
                            e.place_1stNumber.toString())), //place 1st number
                        DataCell(Text(e.racesNumber ?? "N/A")), //races number
                        DataCell(Text(
                            "${formatCurrency.format(double.parse(e.netTotalPrizeMoney??"0.0"))}")), //net total prize
                        //DataCell(Text(e.sp)),
                      ]);
                }).toList()
              : [
                  DataRow(
                      color: MaterialStateColor.resolveWith(
                        (states) =>
                            i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
                      ),
                      cells: [
                        DataCell(Text("No data")),
                        DataCell(Text("No data")),
                        DataCell(Text("No data")),
                        DataCell(Text("No data")),
                        //DataCell(Text(e.sp)),
                      ])
                ]),
    );

    // : Container(
    //     height: MediaQuery.of(context).size.height * 0.5,
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           CircularProgressIndicator(),
    //           SizedBox(
    //             height: 20.0,
    //           ),
    //           Text('Loading...')
    //         ],
    //       ),
    //     ),
    //   );
  }
}

// ignore: slash_for_doc_comments
/***************Stats Table**************************************** */
class StatsDataTable extends StatefulWidget {
  List<StatsSummary>? statsList;
  List<BigRaceWinsModel>? raceLists;

  StatsDataTable({required this.raceLists, required this.statsList});

  @override
  _StatsDataTableState createState() => _StatsDataTableState();
}

class _StatsDataTableState extends State<StatsDataTable> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return widget.raceLists!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stats',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xffF3F3F3),
                  ),
                  headingRowHeight: 43.0,
                  dataRowHeight: 43.0,
                  dividerThickness: 0.0,
                  columnSpacing: 10.0,
                  //horizontalMargin: 0.0,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Year',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Wins',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Runs',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        '%',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'T.Earnings',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Stake',
                        style: TextStyle(
                          color: Color(0xFF02458A),
                        ),
                      ),
                    ),
                  ],
                  rows: widget.statsList!.isNotEmpty
                      ? widget.statsList!.map((e) {
                          //DateTime date = DateTime.parse(e.seasonStartDate!);
                          //  String month = monthList[date.month - 1];
                          return DataRow(
                              // color: MaterialStateColor.resolveWith(
                              //   (states) => e.index % 2 != 0
                              //       ? Color(0xffF3F3F3)
                              //       : Colors.white,
                              // ),
                              cells: [
                                DataCell(
                                  Text(e.year ?? "No data"),
                                ),
                                DataCell(Text(e.wins != null
                                    ? e.wins!.toString()
                                    : "No data")),
                                DataCell(Text(e.runs != null
                                    ? e.runs!.toString()
                                    : "No data")),
                                DataCell(Text(e.percentWinsRuns != null
                                    ? e.percentWinsRuns!.toString()
                                    : "No data")),
                                DataCell(Text(e.earnings != null
                                    ? formatCurrency
                                        .format(double.parse(e.earnings!))
                                    : "No data")),
                                DataCell(Text(e.stake != null
                                    ? e.stake!.toString()
                                    : "No data")),
                                //DataCell(Text(e.sp)),
                              ]);
                        }).toList()
                      : [
                          DataRow(
                              color: MaterialStateColor.resolveWith(
                                (states) => i % 2 != 0
                                    ? Color(0xffF3F3F3)
                                    : Colors.white,
                              ),
                              cells: [
                                DataCell(Text("No data")),
                                DataCell(Text("No data")),
                                DataCell(Text("No data")),
                                DataCell(Text("No data")),
                                DataCell(Text("No data")),
                                DataCell(Text("No data")),
                                //DataCell(Text(e.sp)),
                              ])
                        ]),
              SizedBox(
                height: 25.0,
              ),
              Text(
                'Big Race Wins',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xffF3F3F3),
                    ),
                    headingRowHeight: 43.0,
                    dataRowHeight: 43.0,
                    dividerThickness: 0.0,
                    columnSpacing: 5.0,
                    horizontalMargin: 1.0,
                    showCheckboxColumn: false,
                    columns: [
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(
                            color: Color(0xFF02458A),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Race Name',
                          style: TextStyle(
                            color: Color(0xFF02458A),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Horse',
                          style: TextStyle(
                            color: Color(0xFF02458A),
                          ),
                        ),
                      ),
                      // DataColumn(
                      //   label: Text(
                      //     'Trainers',
                      //     style: TextStyle(
                      //       color: Color(0xFF02458A),
                      //     ),
                      //   ),
                      // ),
                      DataColumn(
                        label: Text(
                          'Winnings',
                          style: TextStyle(
                            color: Color(0xFF02458A),
                          ),
                        ),
                      ),
                    ],
                    rows: widget.raceLists!.isNotEmpty
                        ? widget.raceLists!.map((e) {
                      DateTime date;
                      String month,parsedDate;
                      //e.raceDatetime=null;
                      if(e.raceDatetime!=null){
                        date = DateTime.parse(e.raceDatetime!);
                        month = monthList[date.month - 1];
                        parsedDate = "${date.day}$month${date.year.toString().substring(2)}";
                      }else{
                        date = DateTime.now();
                        month = "N/A";
                        parsedDate = "N/A";
                      }
                      i = i + 1;
                            return DataRow(
                                onSelectChanged: (val) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => RaceDetailsScreen(
                                            index: 0,
                                              raceId: e.raceInstanceUid
                                                  .toString())));
                                },
                                color: MaterialStateColor.resolveWith(
                                  (states) => e.index! % 2 != 0
                                      ? Color(0xffF3F3F3)
                                      : Colors.white,
                                ),
                                cells: [
                                  DataCell(Text(
                                      "$parsedDate")),
                                  DataCell(Container(
                                    width: 170,
                                    child: Text(
                                      e.raceInstanceTitle!.toString(),
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                    ),
                                  )),
                                  DataCell(Text(e.horseStyleName!.toString())),
                                  // DataCell(Text(e.trainerStyleName!.toString())),
                                  DataCell(Text(formatCurrency
                                      .format(double.parse(e.prizeSterling!)))),
                                  //DataCell(Text(e.sp)),
                                ]);
                          }).toList()
                        : [
                            DataRow(
                                color: MaterialStateColor.resolveWith(
                                  (states) => i % 2 != 0
                                      ? Color(0xffF3F3F3)
                                      : Colors.white,
                                ),
                                cells: [
                                  DataCell(Text("No Data")),
                                  DataCell(Text("No Data")),
                                  DataCell(Text("No Data")),
                                  DataCell(Text("No Data")),
                                  DataCell(Text("No Data")),
                                  //DataCell(Text(e.sp)),
                                ])
                          ]),
              ),
            ],
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Loading...')
                ],
              ),
            ),
          );
  }
}
