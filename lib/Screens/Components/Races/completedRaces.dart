import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/raceDetailsModel.dart';
import 'package:racing_eye/Screens/Components/datePicker.dart';
import 'package:racing_eye/Screens/Components/raceCard.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';
import 'package:racing_eye/main.dart';

class CompletedRaces extends StatefulWidget {
  const CompletedRaces({Key? key}) : super(key: key);

  @override
  _CompletedRacesState createState() => _CompletedRacesState();
}

class _CompletedRacesState extends State<CompletedRaces> {
  DateTime dateTime = DateTime.now();
  List<RaceDetailsModel> preserveList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preserveList = Provider.of<CompletedRaceProvider>(context, listen: false)
        .completeRaces;
    print("Length=========${preserveList.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),
              ),
              GestureDetector(
                onTap: () async {
                  final picked = await selectDateAndroid(context);
                  Provider.of<CompletedRaceProvider>(context, listen: false)
                      .addList(preserveList);
                  var provider =
                      Provider.of<CompletedRaceProvider>(context, listen: false)
                          .completeRaces;
                  setState(() {
                    if (picked != null) {
                      dateTime = picked;
                    }
                  });

                  print("Length=========${preserveList.length}");
                  List<RaceDetailsModel> list = [];
                  for (var i in provider) {
                    int month = DateTime.parse(i.raceDatetime!).month;
                    int year = DateTime.parse(i.raceDatetime!).year;
                    if (month == dateTime.month && year == dateTime.year) {
                      list.add(i);
                    }
                  }
                  print(list.length);
                  Provider.of<CompletedRaceProvider>(context, listen: false)
                      .addList(list);
                },
                child: Container(
                  height: 35.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset('images/SVGS/Calender.svg'),
                      Text(
                        "${monthList[dateTime.month - 1]} ${dateTime.year.toString()}",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Image.asset("images/downArrow.png")
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(child:
              Consumer<CompletedRaceProvider>(builder: (context, data, _) {
            return data.completeRaces.isNotEmpty
                ? ListView.builder(
                    itemCount: data.completeRaces.length,
                    itemBuilder: (context, index) {
                      return RacesCard(
                        dataModel: data.completeRaces[index],
                        showTime: true,
                      );
                    })
                : Center(
                    child: Text(
                      "No completed races",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: myColor.shade50.withOpacity(0.5)),
                    ),
                  );
          }))
        ],
      ),
    );
  }
}
