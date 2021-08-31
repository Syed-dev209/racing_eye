import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModel/bigRaceWins.dart';
import 'package:racing_eye/Models/OwnerModel/horseModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerEntriesModel.dart';
import 'package:racing_eye/Models/OwnerModel/ownerLast14Days.dart';
import 'package:racing_eye/Models/OwnerModel/statsSummary.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import 'package:intl/intl.dart';

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

class FormDataTable extends StatefulWidget {
  int ownerId;
  List<Last14Days> list = [];

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
    print("Owner Id;- ${widget.ownerId}");
    return widget.list.isNotEmpty
        ? SizedBox(
            width: double.maxFinite,
            child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xffF3F3F3),
                ),
                headingRowHeight: 43.0,
                dataRowHeight: 43.0,
                dividerThickness: 0.0,
                columnSpacing: 12.0,
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
                        DateTime date = DateTime.parse(e.raceDatetime!);
                        String month = monthList[date.month - 1];
                        return DataRow(
                            color: MaterialStateColor.resolveWith(
                              (states) => e.index % 2 != 0
                                  ? Color(0xffF3F3F3)
                                  : Colors.white,
                            ),
                            cells: [
                              DataCell(Text(
                                "${date.day}$month${date.year}",
                                textAlign: TextAlign.center,
                              )),
                              DataCell(Text(e.courseRpAbbrev3!)),
                              DataCell(Text("${e.raceOutcomeCode!}")),
                              DataCell(Text(e.horseStyleName!)),
                              DataCell(Text(e.oddsDesc!)),
                            ]);
                      }).toList()),
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

//////////////////////////////////////////////////////////////////
class EntriesDataTable extends StatefulWidget {
  int ownerId;
  List<Entries>? list;

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
        ? SizedBox(
            width: double.maxFinite,
            child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xffF3F3F3),
                ),
                headingRowHeight: 43.0,
                dataRowHeight: 43.0,
                dividerThickness: 0.0,
                columnSpacing: 5.0,
                horizontalMargin: 0,
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
                            color: MaterialStateColor.resolveWith(
                              (states) => e.index % 2 != 0
                                  ? Color(0xffF3F3F3)
                                  : Colors.white,
                            ),
                            cells: [
                              DataCell(Text(
                                "${date.day}$month${date.year}",
                                textAlign: TextAlign.center,
                              )),
                              DataCell(Text(e.horseName!)),
                              DataCell(Text(
                                e.raceInstanceTitle!,
                                overflow: TextOverflow.fade,
                                softWrap: false,
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

////////////////////////////////////////////////////////////////////

class HorsesDataTable extends StatefulWidget {
  int ownerId;
  List<Horses>? list;

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
        DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color(0xffF3F3F3),
            ),
            headingRowHeight: 43.0,
            dataRowHeight: 43.0,
            dividerThickness: 0.0,
            columnSpacing: 20.0,
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
                        color: MaterialStateColor.resolveWith(
                          (states) => e.index % 2 != 0
                              ? Color(0xffF3F3F3)
                              : Colors.white,
                        ),
                        cells: [
                          DataCell(Text(e.horseName!)),
                          DataCell(Text(e.place1stNumber!.toString())),
                          DataCell(Text(e.racesNumber!.toString())),
                          DataCell(Text(
                              "${formatCurrency.format(e.netTotalPrizeMoney!)}")),
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
                  ]);
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

class StatsDataTable extends StatefulWidget {
  List<StatisticalSummary>? statsList;
  List<BigRaceWin>? raceLists;

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
                  horizontalMargin: 0.0,
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
                          DateTime date = DateTime.parse(e.seasonStartDate!);
                          String month = monthList[date.month - 1];
                          return DataRow(
                              color: MaterialStateColor.resolveWith(
                                (states) => e.index % 2 != 0
                                    ? Color(0xffF3F3F3)
                                    : Colors.white,
                              ),
                              cells: [
                                DataCell(
                                  Text(e.seasonStartDate != null
                                      ? "${date.day}$month${date.year}"
                                      : "No data"),
                                ),
                                DataCell(Text(e.place1stNumber != null
                                    ? e.place1stNumber!.toString()
                                    : "No data")),
                                DataCell(Text(e.racesNumber != null
                                    ? e.racesNumber!.toString()
                                    : "No data")),
                                DataCell(Text(e.winPercent != null
                                    ? e.winPercent!.toString()
                                    : "No data")),
                                DataCell(Text(e.totalPrize != null
                                    ? formatCurrency.format(e.totalPrize!)
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
              DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xffF3F3F3),
                  ),
                  headingRowHeight: 43.0,
                  dataRowHeight: 43.0,
                  dividerThickness: 0.0,
                  columnSpacing: 5.0,
                  horizontalMargin: 1.0,
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
                          DateTime date = DateTime.parse(e.raceDate!);
                          String month = monthList[date.month - 1];
                          i = i + 1;
                          return DataRow(
                              color: MaterialStateColor.resolveWith(
                                (states) => e.index % 2 != 0
                                    ? Color(0xffF3F3F3)
                                    : Colors.white,
                              ),
                              cells: [
                                DataCell(Text("${date.day}$month${date.year}")),
                                DataCell(Text(
                                  e.raceInstanceTitle!.toString(),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                )),
                                DataCell(Text(e.horseStyleName!.toString())),
                                // DataCell(Text(e.trainerStyleName!.toString())),
                                DataCell(Text(e.prizeSterling!.toString())),
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
