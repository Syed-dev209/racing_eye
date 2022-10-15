import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/horseEntriesModel.dart';
import 'package:racing_eye/Models/horseFormModel.dart';
import 'package:racing_eye/Models/horseRecordsModel.dart';
import 'package:racing_eye/Models/horseSalesModel.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerTables.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import 'package:racing_eye/Screens/raceDetailsScreen.dart';
import 'package:racing_eye/main.dart';

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
      child: widget.dataTable,
    );
  }
}

// ignore: slash_for_doc_comments
/**********************Form Data Table********************************************* */
class HorseFormDataTable extends StatefulWidget {
  bool showUpper=true;
  HorseFormDataTable({this.showUpper=true});

  @override
  _HorseFormDataTableState createState() => _HorseFormDataTableState();
}

class _HorseFormDataTableState extends State<HorseFormDataTable> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<HorseRecordProvider>(
            builder: (context, data, _) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: widget.showUpper?
                data != null
                    ? DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xffF3F3F3),
                        ),
                        headingRowHeight: 43.0,
                        dataRowHeight: 43.0,
                        dividerThickness: 0.0,
                        columnSpacing: 30,
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
                              DataCell(data.rulesRace != null
                                  ? Text("${data.rulesRace!.wins}")
                                  : Text('N/A')),
                              DataCell(data.rulesRace != null
                                  ? Text(formatCurrency.format(double.parse(
                                      "${data.rulesRace!.netTotalPrize!}")))
                                  : Text('N/A')),
                              DataCell(data.rulesRace != null
                                  ? Text("${data.rulesRace!.or.toString()}")
                                  : Text('N/A')),
                              DataCell(data.rulesRace != null
                                  ? Text("${data.rulesRace!.bestTs.toString()}")
                                  : Text('N/A')),

                              //DataCell(Text(e.sp)),
                            ]),
                            DataRow(
                                color: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffF3F3F3),
                                ),
                                cells: [
                                  DataCell(Text("Flat Turf")),
                                  DataCell(data.flatTurf != null
                                      ? Text(data.flatTurf!.wins.toString())
                                      : Text('N/A')),
                                  DataCell(data.flatTurf != null
                                      ? Text(formatCurrency.format(double.parse(
                                          data.flatTurf!.netTotalPrize!)))
                                      : Text('N/A')),
                                  DataCell(data.flatTurf != null
                                      ? Text(data.flatTurf!.or.toString())
                                      : Text('N/A')),
                                  DataCell(data.flatTurf != null
                                      ? Text(data.flatTurf!.bestTs.toString())
                                      : Text('N/A')),
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
                        )
                    : Center(
                        child: Text(
                          "No data",
                          style: TextStyle(
                              color: myColor.shade50.withOpacity(0.6),
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ):Text(""),
              );
            },
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            'Form',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
          ),
          Consumer<HorseFormProvider>(
            builder: (context, data, _) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
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
                    rows: data.formModel.isNotEmpty
                        ? data.formModel.map((e) {
                            DateTime date = DateTime.parse(e.raceDatetime!);
                            String month = monthList[date.month - 1];
                            i = i + 1;
                            return DataRow(
                                // color: MaterialStateColor.resolveWith(
                                //   (states) => e.! % 2 != 0
                                //       ? Color(0xffF3F3F3)
                                //       : Colors.white,
                                // ),
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
                                  DataCell(
                                      Text(e.officialRatingRanOff.toString())),
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
                                  DataCell(Text("No Data")),
                                ])
                          ]),
              );
            },
          ),
        ],
      ),
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
      return SingleChildScrollView(
        child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color(0xffF3F3F3),
            ),
            headingRowHeight: 43.0,
            dataRowHeight: 50.0,
            dividerThickness: 0.0,
            columnSpacing: 20.0,
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
            rows: data.dataModel.isNotEmpty
                ? data.dataModel.map((e) {
                    i = i + 1;
                    DateTime date = DateTime.parse(e.raceDatetime!);
                    String month = monthList[date.month - 1];
                    return DataRow(
                        onSelectChanged: (val) {

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => RaceDetailsScreen(
                                    index: 0,
                                      raceId: e.raceInstanceUid.toString())));
                        },
                        // color: MaterialStateColor.resolveWith(
                        //   (states) => e.index! % 2 != 0
                        //       ? Color(0xffF3F3F3)
                        //       : Colors.white,
                        // ),
                        cells: [
                          DataCell(Text(
                              "${date.day}$month${date.year.toString().substring(2)}")),
                          DataCell(Container(
                            width: 150,
                            child: Text(
                              e.raceInstanceTitle!,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          )),
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
                  ]),
      );
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
        return data.salesModel.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, i) {
                  return dataBox(data.salesModel[i]);
                },
                separatorBuilder: (context, i) => SizedBox(
                      height: 10,
                    ),
                itemCount: data.salesModel.length)
            : Center(
                child: Text(
                  "No sales data",
                  style: TextStyle(
                      color: myColor.shade50.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              );
      },
    );
  }

  Widget dataBox(HorseSalesModel modeldata) {

    double price = double.parse(modeldata.price == "" || modeldata.price == null
        ? "0.00"
        : modeldata.price!);
    return Container(
      width: double.maxFinite,
      height: 200,
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      child: Column(
        children: [
          dataRow("Ven.", modeldata.venueDesc!),
          Container(
            width: double.maxFinite,
            height: 1,
            color: Colors.black26,
          ),
          dataRow("Name", modeldata.abbrevName!),
          Container(
            width: double.maxFinite,
            height: 1,
            color: Colors.black26,
          ),
          dataRow("Lot No.", modeldata.lotNo!.toString()),
          Container(
            width: double.maxFinite,
            height: 1,
            color: Colors.black26,
          ),
          dataRow("Price", formatCurrency.format(price)),
          //modeldata.price.toString()),
          Container(
            width: double.maxFinite,
            height: 1,
            color: Colors.black26,
          ),
          dataRow("Seller", modeldata.sellerName!),
          Container(
            width: double.maxFinite,
            height: 1,
            color: Colors.black26,
          ),
          dataRow("Buyer", modeldata.buyerDetail ?? "N/A"),
        ],
      ),
    );
  }

  Widget dataRow(String title, String value) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   width: 3,
          // ),
          Expanded(
            child: Center(
              child: Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ),
          Container(
            height: 35,
            width: 1,
            color: Colors.black26,
          ),
          Expanded(
              flex: 2,
              child: Text(
                "  $value",
                style: TextStyle(fontWeight: FontWeight.w400),
              )),
        ],
      ),
    );
  }
}

// DataTable(
// headingRowColor: MaterialStateColor.resolveWith(
// (states) => Color(0xffF3F3F3),
// ),
// headingRowHeight: 43.0,
// dataRowHeight: 50.0,
// dividerThickness: 0.0,
// columnSpacing: 5.0,
// horizontalMargin: 1,
// columns: [
// DataColumn(
// label: Text(
// 'Ven.',
// style: TextStyle(
// color: Color(0xFF02458A),
// ),
// ),
// ),
// DataColumn(
// label: Text(
// 'Name',
// style: TextStyle(
// color: Color(0xFF02458A),
// ),
// ),
// ),
// DataColumn(
// label: Text(
// 'LotNo.',
// style: TextStyle(
// color: Color(0xFF02458A),
// ),
// ),
// ),
// DataColumn(
// label: Text(
// 'Price.',
// style: TextStyle(
// color: Color(0xFF02458A),
// ),
// ),
// ),
// DataColumn(
// label: Text(
// 'Seller',
// style: TextStyle(
// color: Color(0xFF02458A),
// ),
// ),
// ),
// DataColumn(
// label: Text(
// 'Buyer',
// style: TextStyle(
// color: Color(0xFF02458A),
// ),
// ),
// ),
// ],
// rows: data.salesModel!.sales!.isNotEmpty
// ? data.salesModel!.sales!.map((e) {
// i = i + 1;
// return DataRow(
// color: MaterialStateColor.resolveWith(
// (states) => e!.index! % 2 != 0
// ? Color(0xffF3F3F3)
//     : Colors.white,
// ),
// cells: [
// DataCell(Text(e!.venueDesc!)),
// DataCell(Text(
// e.abbrevName!,
// softWrap: false,
// overflow: TextOverflow.fade,
// )),
// DataCell(Text(e.lotNo.toString(),
// softWrap: false, overflow: TextOverflow.fade)),
// DataCell(Text(
// "${formatCurrency.format(e.price)}",
// style: TextStyle(
// fontSize: 10, fontWeight: FontWeight.bold),
// )),
// DataCell(Text(e.sellerName!,
// softWrap: false, overflow: TextOverflow.fade)),
// DataCell(Text(e.buyerDetail!,
// softWrap: false, overflow: TextOverflow.fade))
// ]);
// }).toList()
//     : [
// DataRow(
// color: MaterialStateColor.resolveWith(
// (states) =>
// i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
// ),
// cells: [
// DataCell(Text("No data")),
// DataCell(Text("No data")),
// DataCell(Text("No data")),
// DataCell(Text("No data")),
// DataCell(Text("Nob data")),
// ])
// ])
