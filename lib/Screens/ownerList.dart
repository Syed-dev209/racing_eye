import 'package:flutter/material.dart';
import 'package:racing_eye/Models/OwnerModels/ownerData.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/OwnerComponents/ownerCard.dart';

class OwnerList extends StatefulWidget {
  List<OwnersData>? data;
  OwnerList({this.data});
  @override
  _OwnerListState createState() => _OwnerListState();
}

class _OwnerListState extends State<OwnerList> {
  List<OwnersData> ownersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ownersList = widget.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.964,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
