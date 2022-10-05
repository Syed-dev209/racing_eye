import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Controller/ownerAPIController.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerCard.dart';
import 'package:racing_eye/main.dart';

class OwnerList extends StatefulWidget {
  OwnerList();
  @override
  _OwnerListState createState() => _OwnerListState();
}

class _OwnerListState extends State<OwnerList> {
  List<OwnersData> ownersList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomWhiteAppBar(
          headerText: 'Branches',
          showTrailing: false,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(child:
                    Consumer<OwnerDataProvider>(builder: (context, data, _) {
                  return data.ownerList.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: data.ownerList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: OwnerCard(
                                bgColorWhite: true,
                                ownerData: data.ownerList[index],
                              ),
                            );
                          })
                      : Center(
                          child: Text(
                            "No Owners",
                            style: TextStyle(
                                color: myColor.shade50.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          ),
                        );
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
