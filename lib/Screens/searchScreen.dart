import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/dropDowns.dart';
import 'package:racing_eye/main.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> years = [
    "Select",
    "1999",
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009"
  ];
  List<String> ownerNames = ["Select Owner", "Syed", "Ilhan", "Shah", "Jani"];
  String startYear = "Select";
  String endYear = "Select";
  String? ownerName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ownerName = ownerNames.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWhiteAppBar(
                headerText: 'Search',
                showTrailing: false,
              ),
              SizedBox(
                height: 45.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start year",
                        style: TextStyle(
                            color: Color(0xffBBC3CE),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      dropDownAndroid(years, startYear, (val) {
                        setState(() {
                          startYear = val;
                        });
                      }),
                    ],
                  )),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Year',
                        style: TextStyle(
                            color: Color(0xffBBC3CE),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      dropDownAndroid(years, endYear, (val) {
                        setState(() {
                          endYear = val;
                        });
                      }),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Owners',
                style: TextStyle(
                    color: Color(0xffBBC3CE),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              dropDownAndroid(ownerNames, ownerName!, (val) {
                setState(() {
                  ownerName = val;
                });
              }),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Search Results",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return SearchedCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchedCard extends StatelessWidget {
  const SearchedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.0, right: 2.0, bottom: 15.0),
      child: Container(
        height: 200.0,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 27.0,
                  backgroundImage: AssetImage("images/Apple.png"),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 22.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: myColor.shade50,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Mall Road, Abu Dhabi',
                          style: TextStyle(color: Color(0xff777d80)),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 3.0,
              width: double.maxFinite,
              color: Color(0xffe6e6e6),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                details("Year", "2021"),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Wins", "91"),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Runs", "300"),
              ],
            ),
            SizedBox(
              height: 18.0,
              child: Row(
                children: List.generate(
                    150 ~/ 4,
                    (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : Color(0xffe6e6e6),
                            height: 1,
                          ),
                        )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                details("Wins", "20%"),
                SizedBox(
                  width: 9.0,
                ),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Total Earnings", "\$2000.00"),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Stake", "300"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget details(String title, String value) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Color(0xff000080), fontSize: 16.0),
        ),
        Center(
          child: Text(
            value,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
