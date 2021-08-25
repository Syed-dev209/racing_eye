import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModels/OwnerFormDataTableModel.dart';
import 'package:racing_eye/Models/OwnerModels/horseModel.dart';
import 'package:racing_eye/Models/OwnerModels/ownerEntriesModel.dart';
import 'package:racing_eye/Models/OwnerModels/ownerLast14Days.dart';

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



class FormDataTable extends StatefulWidget {
  int ownerId;
  List<Last14Days> list=[];
  FormDataTable({required this.ownerId,required this.list});
  @override
  _FormDataTableState createState() => _FormDataTableState();
}

class _FormDataTableState extends State<FormDataTable> {

  int i=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    print("Owner Id;- ${widget.ownerId}");
    return widget.list.isNotEmpty? SizedBox(
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
          rows: widget.list.isEmpty?
              [
                DataRow(
                  cells: [
                    DataCell(Text('No data ')),
                    DataCell(Text('No data ')),
                    DataCell(Text('No data ')),
                    DataCell(Text('No data ')),
                    DataCell(Text('No data ')),
                  ]
                )
          ]
              : widget.list.map((e) {
            if(i==0){
              i=0;
            }
            else {
              i = i + 1;
            }
            return DataRow(
                color: MaterialStateColor.resolveWith(
                      (states) =>
                  i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
                ),
                cells: [
                  DataCell(Text("${e.raceDatetime!.substring(0,10)}",textAlign: TextAlign.center,)),
                  DataCell(Text(e.courseRpAbbrev3!)),
                  DataCell(Text("${e.raceOutcomeCode!}")),
                  DataCell(Text(e.horseStyleName!)),
                  DataCell(Text(e.oddsDesc!)),
                ]);
          }).toList()),
    ): Container(
      height: MediaQuery.of(context).size.height*0.5,
      child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
            CircularProgressIndicator(),
          SizedBox(height: 20.0,),
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
  List<Entries> list;
  EntriesDataTable({required this.ownerId,required this.list}) ;

  @override
  _EntriesDataTableState createState() => _EntriesDataTableState();
}

class _EntriesDataTableState extends State<EntriesDataTable> {

  int i =0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return widget.list.isNotEmpty? SizedBox(
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
          rows: widget.list.map((e) {
            if(i == 0){
              i=0;
            }
            else {
              i = i + 1;
            }
            return DataRow(
                color: MaterialStateColor.resolveWith(
                      (states) =>
                 i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
                ),
                cells: [
                  DataCell(Text(e.raceDatetime!.substring(0,10))),
                  DataCell(Text(e.horseName!)),
                  DataCell(Text(e.raceInstanceTitle!,overflow: TextOverflow.fade,softWrap: false,)),
                  DataCell(Text(e.courseStyleName!)),
                  //DataCell(Text(e.sp)),
                ]);
          }).toList()),
    ):Container(
      height: MediaQuery.of(context).size.height*0.5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20.0,),
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
  List<Horses> list;
  HorsesDataTable({required this.ownerId,required this.list});

  @override
  _HorsesDataTableState createState() => _HorsesDataTableState();
}

class _HorsesDataTableState extends State<HorsesDataTable> {
  int i=-1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return widget.list.isNotEmpty? DataTable(
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
        rows:  widget.list.map((e) {
          i=i+1;
          return DataRow(
              color: MaterialStateColor.resolveWith(
                    (states) =>
                i % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
              ),
              cells: [
                DataCell(Text(e.horseName!)),
                DataCell(Text(e.place1stNumber!.toString())),
                DataCell(Text(e.racesNumber!.toString())),
                DataCell(Text(e.netTotalPrizeMoney!.toString())),
                //DataCell(Text(e.sp)),
              ]);
        }

        ).toList()
    ):Container(
      height: MediaQuery.of(context).size.height*0.5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20.0,),
            Text('Loading...')
          ],
        ),
      ),
    );
  }
}
