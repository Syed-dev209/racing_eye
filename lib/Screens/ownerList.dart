import 'package:flutter/material.dart';
import 'package:racing_eye/Models/ownerData.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/ownerCard.dart';

class OwnerList extends StatefulWidget {
  List<Owners>? data;
  OwnerList({this.data});
  @override
  _OwnerListState createState() => _OwnerListState();
}

class _OwnerListState extends State<OwnerList> {
  List<Owners> ownersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ownersList = widget.data!;
    // ownersList.add(Owners(
    //     id: 1,
    //     uid: 221,
    //     ownerName: "Ilhan",
    //     ptpTypeCode: "f",
    //     silk: "f",
    //     styleName: "g",
    //     silkImagePath: "h",
    //     createdAt: "ew",
    //     updatedAt: "f"));
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
                              ownerName: ownersList[index].ownerName!,
                              flagUrl:
                                  "https://www.publicdomainpictures.net/pictures/350000/velka/uae-flag.jpg",
                              ownerImage: "images/pic.PNG"),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
