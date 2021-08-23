import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/indicator/standard_indicator.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:racing_eye/Models/OwnerFormDataTableModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';

class OwnerDetails extends StatefulWidget {
  const OwnerDetails({Key? key}) : super(key: key);

  @override
  _OwnerDetailsState createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          height: MediaQuery.of(context).size.height * 0.964,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CustomWhiteAppBar(
                headerText: 'Owner Details',
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 25.0, right: 10.0, top: 15.0, bottom: 15.0),
                height: 90.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color(0xff02468D),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(children: [
                  ImagePlaceHolder(
                    imagePath: 'images/google.png',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        'Syed Ilhan Shah',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'images/cup.png',
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'AED 0.00',
                            style: TextStyle(
                                color: Color(0xff6790BB), fontSize: 15.0),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.0,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 53.0,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 17.0,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Flag_of_Pakistan.svg/1200px-Flag_of_Pakistan.svg.png'),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(child: OwnerDataTable())
            ],
          ),
        ),
      ),
    );
  }
}

class OwnerDataTable extends StatefulWidget {
  @override
  _OwnerDataTableState createState() => _OwnerDataTableState();
}

class _OwnerDataTableState extends State<OwnerDataTable>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [
    Tab(
      text: " Form",
    ),
    Tab(
      text: " Entries",
    ),
    Tab(
      text: " Horses",
    ),
    Tab(
      text: " Results",
    ),
  ];
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 40.0,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Color(0xffD8E2EE),
                  borderRadius: BorderRadius.circular(20.0)),
              child: TabBar(
                tabs: tabs,
                controller: controller,
                unselectedLabelColor: Color(0xFF02458A),
                unselectedLabelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                labelColor: Colors.white,
                //  indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                indicator: BubbleTabIndicator(
                  indicatorRadius: 20.0,
                  indicatorHeight: 35.0,
                  indicatorColor: Color(0xFF02458A),
                  // tabBarIndicatorSize: TabBarIndicatorSize.tab,
                ),
              )),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                OwnerFormDataTable(),
                Text('entries'),
                Text('horses'),
                Text('results'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OwnerFormDataTable extends StatefulWidget {


  @override
  _OwnerFormDataTableState createState() => _OwnerFormDataTableState();
}

class _OwnerFormDataTableState extends State<OwnerFormDataTable> {
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
    list = generateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.0),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith((states) =>  Color(0xffF3F3F3),) ,
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
            rows: list!.map((e){
              return DataRow(
                color: MaterialStateColor.resolveWith((states)=> e.index % 2!=0? Color(0xffF3F3F3) : Colors.white ,),
                  cells: [
                    DataCell(Text(e.date)),
                    DataCell(Text(e.crs)),
                    DataCell(Text(e.pos)),
                    DataCell(Text(e.horse)),
                    DataCell(Text(e.sp)),
                  ]
              );
            }).toList()
        ),
      ),
    );
  }
}
