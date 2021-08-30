import 'package:flutter/material.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModels/ownerData.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerCard.dart';

class OwnerList extends StatefulWidget {
  OwnerList();
  @override
  _OwnerListState createState() => _OwnerListState();
}

class _OwnerListState extends State<OwnerList> {
  List<OwnersData> ownersList = [];
  bool loaded = false;

  getOwnerListDetails() async {
    await getAllOwnerList().then((value) {
      setState(() {
        ownersList = value;
        loaded = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOwnerListDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.964,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
          child: loaded
              ? Column(
                  children: [
                    CustomWhiteAppBar(
                      headerText: 'Owners',
                      showTrailing: false,
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: ownersList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.0),
                                child: OwnerCard(
                                  bgColorWhite: true,
                                  ownerData: ownersList[index],
                                ),
                              );
                            }))
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Loading...',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
