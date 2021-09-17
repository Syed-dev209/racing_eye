import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/horseEntriesModel.dart';
import 'package:racing_eye/Models/horseFormModel.dart';
import 'package:racing_eye/Models/horseProfileModel.dart';
import 'package:racing_eye/Models/horseRecordsModel.dart';
import 'package:racing_eye/Models/horseSalesModel.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerTables.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';

class HorseDataTables extends StatefulWidget {
  Widget dataTable;
  HorseDataTables({required this.dataTable});

  @override
  _HorseDataTablesState createState() => _HorseDataTablesState();
}

class _HorseDataTablesState extends State<HorseDataTables> {
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

// ignore: slash_for_doc_comments
/**********************Form Data Table********************************************* */
class HorseFormDataTable extends StatefulWidget {
  const HorseFormDataTable({Key? key}) : super(key: key);

  @override
  _HorseFormDataTableState createState() => _HorseFormDataTableState();
}

class _HorseFormDataTableState extends State<HorseFormDataTable> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<HorseRecordProvider>(
          builder: (context, data, _) {
            return DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xffF3F3F3),
                ),
                headingRowHeight: 43.0,
                dataRowHeight: 43.0,
                dividerThickness: 0.0,
                columnSpacing: 32.0,
                horizontalMargin: 1.0,
                columns: [
                  DataColumn(
                    label: Text(
                      'LifeTime\nRecord',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Runs\nWins',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Prize',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Best Ts',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                ],
                rows:
                    // data.profile.data.!.isNotEmpty
                    // ?
                    [
                  DataRow(cells: [
                    DataCell(Text("Rules Race")),
                    DataCell(Text(data
                        .recordsModel!.data!.lifetimeRecords!.rulesRaces!.wins
                        .toString())),
                    DataCell(Text(formatCurrency.format(data.recordsModel!.data!
                        .lifetimeRecords!.rulesRaces!.netTotalPrize))),
                    DataCell(Text(data
                        .recordsModel!.data!.lifetimeRecords!.rulesRaces!.or
                        .toString())),
                    DataCell(Text(data
                        .recordsModel!.data!.lifetimeRecords!.rulesRaces!.bestTs
                        .toString())),

                    //DataCell(Text(e.sp)),
                  ]),
                  DataRow(
                      color: MaterialStateColor.resolveWith(
                        (states) => Color(0xffF3F3F3),
                      ),
                      cells: [
                        DataCell(Text("Flat Turf")),
                        DataCell(Text(data
                            .recordsModel!.data!.lifetimeRecords!.flatTurf!.wins
                            .toString())),
                        DataCell(Text(formatCurrency.format(data.recordsModel!
                            .data!.lifetimeRecords!.flatTurf!.netTotalPrize))),
                        DataCell(Text(data
                            .recordsModel!.data!.lifetimeRecords!.flatTurf!.or
                            .toString())),
                        DataCell(Text(data.recordsModel!.data!.lifetimeRecords!
                            .flatTurf!.bestTs
                            .toString())),
                      ])
                ]
                //         :
                //     [
                //   DataRow(
                //       color: MaterialStateColor.resolveWith(
                //         (states) =>
                //             i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
                //       ),
                //       cells: [
                //         DataCell(Text("No data")),
                //         DataCell(Text("No data")),
                //         DataCell(Text("No data")),
                //         DataCell(Text("No data")),
                //         DataCell(Text("No data")),

                //         //DataCell(Text(e.sp)),
                //       ])
                // ]
                );
          },
        ),
        SizedBox(
          height: 25.0,
        ),
        Text(
          'Form',
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15.0,
        ),
        Consumer<HorseFormProvider>(
          builder: (context, data, _) {
            return DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color(0xffF3F3F3),
                ),
                headingRowHeight: 43.0,
                dataRowHeight: 43.0,
                dividerThickness: 0.0,
                columnSpacing: 30.0,
                horizontalMargin: 0.0,
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
                      'Cond.',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Dist.',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'POS.',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'SP.',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'OR.',
                      style: TextStyle(
                        color: Color(0xFF02458A),
                      ),
                    ),
                  ),
                ],
                rows: data.formModel!.form!.isNotEmpty
                    ? data.formModel!.form!.map((e) {
                        DateTime date = DateTime.parse(e!.raceDatetime!);
                        String month = monthList[date.month - 1];
                        i = i + 1;
                        return DataRow(
                            color: MaterialStateColor.resolveWith(
                              (states) => e.index! % 2 != 0
                                  ? Color(0xffF3F3F3)
                                  : Colors.white,
                            ),
                            cells: [
                              DataCell(Text(
                                  "${date.day}$month${date.year.toString().substring(2)}")),
                              DataCell(Text(
                                e.courseRpAbbrev_3!,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              )),
                              DataCell(Text("${e.distanceFurlong}f")),
                              DataCell(Text(
                                  "${e.raceOutcomeCode}/${e.noOfRunners}")),
                              DataCell(Text(e.oddsDesc ?? "N/A")),
                              DataCell(Text(e.officialRatingRanOff.toString())),
                            ]);
                      }).toList()
                    : [
                        DataRow(
                            color: MaterialStateColor.resolveWith(
                              (states) =>
                                  i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
                            ),
                            cells: [
                              DataCell(Text("No Data")),
                              DataCell(Text("No Data")),
                              DataCell(Text("No Data")),
                              DataCell(Text("No Data")),
                              DataCell(Text("No Data")),
                              DataCell(Text("No Data")),
                            ])
                      ]);
          },
        ),
      ],
    );
  }
}

/// ************************Horse Entries Data table**************************** */
class HorseEntriesDataTable extends StatefulWidget {
  const HorseEntriesDataTable({Key? key}) : super(key: key);

  @override
  _HorseEntriesDataTableState createState() => _HorseEntriesDataTableState();
}

class _HorseEntriesDataTableState extends State<HorseEntriesDataTable> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<HorseEntriesProvider>(builder: (context, data, _) {
      return DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
            (states) => Color(0xffF3F3F3),
          ),
          headingRowHeight: 43.0,
          dataRowHeight: 50.0,
          dividerThickness: 0.0,
          columnSpacing: 20.0,
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
          rows: data.dataModel!.data!.entries!.isNotEmpty
              ? data.dataModel!.data!.entries!.map((e) {
                  i = i + 1;
                  DateTime date = DateTime.parse(e!.raceDatetime!);
                  String month = monthList[date.month - 1];
                  return DataRow(
                      color: MaterialStateColor.resolveWith(
                        (states) => e.index! % 2 != 0
                            ? Color(0xffF3F3F3)
                            : Colors.white,
                      ),
                      cells: [
                        DataCell(Text(
                            "${date.day}$month${date.year.toString().substring(2)}")),
                        DataCell(Text(e.raceInstanceTitle!,softWrap: false,overflow: TextOverflow.fade,)),
                        DataCell(Text(e.courseStyleName!)),
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
                        //DataCell(Text("No data")),
                        //DataCell(Text(e.sp)),
                      ])
                ]);
    });
  }
}

/**************************Horse Sales Data table**************************** */
class HorseSalesDataTable extends StatefulWidget {
  const HorseSalesDataTable({Key? key}) : super(key: key);

  @override
  _HorseSalesDataTableState createState() => _HorseSalesDataTableState();
}

class _HorseSalesDataTableState extends State<HorseSalesDataTable> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<HorseSalesProvider>(
      builder: (context, data, _) {
        return DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color(0xffF3F3F3),
            ),
            headingRowHeight: 43.0,
            dataRowHeight: 50.0,
            dividerThickness: 0.0,
            columnSpacing: 5.0,
            horizontalMargin: 1,
            columns: [
              DataColumn(
                label: Text(
                  'Ven.',
                  style: TextStyle(
                    color: Color(0xFF02458A),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(
                    color: Color(0xFF02458A),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'LotNo.',
                  style: TextStyle(
                    color: Color(0xFF02458A),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Price.',
                  style: TextStyle(
                    color: Color(0xFF02458A),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Seller',
                  style: TextStyle(
                    color: Color(0xFF02458A),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Buyer',
                  style: TextStyle(
                    color: Color(0xFF02458A),
                  ),
                ),
              ),
            ],
            rows: data.salesModel!.sales!.isNotEmpty
                ? data.salesModel!.sales!.map((e) {
                    i = i + 1;
                    return DataRow(
                        color: MaterialStateColor.resolveWith(
                          (states) => e!.index! % 2 != 0
                              ? Color(0xffF3F3F3)
                              : Colors.white,
                        ),
                        cells: [
                          DataCell(Text(e!.venueDesc!)),
                          DataCell(Text(e.abbrevName!,softWrap: false,overflow: TextOverflow.fade,)),
                          DataCell(Text(e.lotNo.toString(),softWrap: false,overflow: TextOverflow.fade)),
                          DataCell(Text("${formatCurrency.format(e.price)}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)),
                          DataCell(Text(e.sellerName!,softWrap: false,overflow: TextOverflow.fade)),
                          DataCell(Text(e.buyerDetail!,softWrap: false,overflow: TextOverflow.fade))
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
                          DataCell(Text("Nob data")),
                        ])
                  ]);
      },
    );
  }
}
