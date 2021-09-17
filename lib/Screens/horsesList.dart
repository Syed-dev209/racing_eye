import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/dropDowns.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';
import 'package:racing_eye/main.dart';

import 'Components/horsecard.dart';

class HorsesList extends StatefulWidget {
  const HorsesList({Key? key}) : super(key: key);

  @override
  _HorsesListState createState() => _HorsesListState();
}

class _HorsesListState extends State<HorsesList> {
  List<String> ages = ["Age", "1", "2", "3", "4"];
  String age = "Age";
  String owner = "";
  List<OwnersData> ownerNames = [];
  OwnersData? ownerName;
  TextEditingController searchedItem = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ownerNames.add(OwnersData(
        id: 0,
        uid: 0,
        ownerName: "Owners",
        ptpTypeCode: " ",
        silk: " ",
        styleName: " ",
        silkImagePath: " ",
        createdAt: " ",
        updatedAt: " ",
        countryFlag: " "));
    for (var data
        in Provider.of<OwnerDataProvider>(context, listen: false).ownerList) {
      ownerNames.add(data);
    }
    ownerName = ownerNames.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
          child: Column(
            children: [
              CustomWhiteAppBar(
                headerText: 'Horses',
                showTrailing: false,
              ),
              SizedBox(
                height: 22.5,
              ),
              Expanded(
                child: Consumer<HorseDetailProvider>(
                  builder: (context, data, _) {
                    List<HorsesDetailModel> list = [];
                    list.addAll(data.dataModel);
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 40,
                                width: double.maxFinite,
                                child: TextFormField(
                                  controller: searchedItem,
                                  onChanged: (val) {
                                    if (searchedItem.text.isNotEmpty) {
                                      print("=====> $val");
                                      List<HorsesDetailModel> searchedList = [];
                                      list.forEach((element) {
                                        if (element.horseName!
                                            .contains(searchedItem.text)) {
                                          print("found");
                                          searchedList.add(element);
                                        }
                                      });
                                      setState(() {
                                        data.dataModel.addAll(searchedList);
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(bottom: 4, left: 15),
                                      suffixIcon: Icon(
                                        Icons.search,
                                        color: myColor.shade100,
                                        size: 18,
                                      ),
                                      labelText: "Horse Name",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                            ),
                            //  SizedBox(width: 8,),
                            // Expanded(
                            //   child: dropDownAndroid(ages, age, (val) {
                            //     setState(() {
                            //       age = val;
                            //     });
                            //   }),
                            // ),
                            // //SizedBox(width: 8,),
                            // Expanded(
                            //   //flex: 2,
                            //   child: dropDownAndroidOwner(ownerNames, ownerName!, (val) {
                            //     setState(() {
                            //       age = val;
                            //     });
                            //   }),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 22.5,
                        ),
                        list.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: list.length,
                                    itemBuilder: (context, index) {
                                      return HorseCard(horseModel: list[index]);
                                    }),
                              )
                            : Center(
                                child: Text(
                                  ' No horses available',
                                  style: TextStyle(
                                      color: myColor.withOpacity(0.5),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
