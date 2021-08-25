import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModels/OwnerFormDataTableModel.dart';
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
  FormDataTable({required this.ownerId});
  @override
  _FormDataTableState createState() => _FormDataTableState();
}

class _FormDataTableState extends State<FormDataTable> {
  List<Last14Days> list=[];
  int i=0;
  bool loaded =false;
  generateList()async {

   await getOwnerLast14DaysData(widget.ownerId).then((value) {
     if(value!=null){
       print(value);
       setState(() {
         loaded=true;
         list = value.data!.last14Days!;
       });
     }
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateList();

  }

  @override
  Widget build(BuildContext context) {
    print("Owner Id;- ${widget.ownerId}");
    return loaded? SizedBox(
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
          rows: list.isEmpty?
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
              : list.map((e) {
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
  const EntriesDataTable({Key? key}) : super(key: key);

  @override
  _EntriesDataTableState createState() => _EntriesDataTableState();
}

class _EntriesDataTableState extends State<EntriesDataTable> {
  List<OwnerFormDataItems>? list;

  List<OwnerFormDataItems> generateList() {
    return List.generate(10, (index) {
      return OwnerFormDataItems(
          index: index,
          date: '18/7/21',
          crs: 'DON',
          pos: '5/9',
          horse: "Horse name",
          sp: '11/1');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = generateList();
  }
  @override
  Widget build(BuildContext context) {
    return DataTable(
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
        rows: list!.map((e) {
          return DataRow(
              color: MaterialStateColor.resolveWith(
                    (states) =>
                e.index % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
              ),
              cells: [
                DataCell(Text(e.date)),
                DataCell(Text(e.crs)),
                DataCell(Text(e.pos)),
                DataCell(Text(e.horse)),
                //DataCell(Text(e.sp)),
              ]);
        }).toList());
  }
}


////////////////////////////////////////////////////////////////////

class HorsesDataTable extends StatefulWidget {
  const HorsesDataTable({Key? key}) : super(key: key);

  @override
  _HorsesDataTableState createState() => _HorsesDataTableState();
}

class _HorsesDataTableState extends State<HorsesDataTable> {
  List<OwnerFormDataItems>? list;

  List<OwnerFormDataItems> generateList() {
    return List.generate(10, (index) {
      return OwnerFormDataItems(
          index: index,
          date: '18/7/21',
          crs: 'DON',
          pos: '5/9',
          horse: "Horse name",
          sp: '11/1');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = generateList();
  }
  @override
  Widget build(BuildContext context) {
    return DataTable(
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
        rows: list!.map((e) {
          return DataRow(
              color: MaterialStateColor.resolveWith(
                    (states) =>
                e.index % 2 != 0 ? Color(0xffF3F3F3) : Colors.white,
              ),
              cells: [
                DataCell(Text(e.date)),
                DataCell(Text(e.crs)),
                DataCell(Text(e.pos)),
                DataCell(Text(e.horse)),
                //DataCell(Text(e.sp)),
              ]);
        }).toList());
  }
}
