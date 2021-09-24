import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/horseProfileModel.dart';
import 'package:racing_eye/main.dart';

class HorseDetailsCard extends StatefulWidget {
  const HorseDetailsCard({Key? key}) : super(key: key);

  @override
  _HorseDetailsCardState createState() => _HorseDetailsCardState();
}

class _HorseDetailsCardState extends State<HorseDetailsCard> {
  double animatedHeight = 0.0;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
      ),
      color: myColor.shade50,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  animatedHeight != 0.0
                      ? animatedHeight = 0.0
                      : animatedHeight = 180.0;
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 65.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        image: DecorationImage(
                            image: AssetImage(
                              "images/horse.png",
                              // height: 60,
                              // width: 60,
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.age!.substring(0, 1)} Yeasrs old, ${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.horseSexCode} ${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.horseColourCode}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage("images/uaeFlag.jpg"),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          Provider.of<HorseProfileProvider>(context,
                                  listen: false)
                              .profile!
                              .data!
                              .profile!
                              .horseName!,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 160.0,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "images/stableBig.png",
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.ownerName}",
                                      style:
                                          TextStyle(color: Color(0xff6790bb)),
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    !isExpanded ? "Show" : "Hide",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up_sharp
                                        : Icons.keyboard_arrow_down_sharp,
                                    size: 16.0,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 0.5,
              width: double.maxFinite,
              color: Color(0xff6790bb).withOpacity(0.4),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 80),
              height: animatedHeight,
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dataRow(
                        title: "Trainer:",
                        name:
                            "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.trainerName}"),
                    dataRow(
                        title: "Branch:",
                        name:
                            "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.ownerName}"),
                    dataRow(
                        title: "Sire:",
                        name:
                            "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.sireHorseName}"),
                    dataRow(
                        title: "Dam:",
                        name:
                            "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.damHorseName}"),
                    dataRow(
                        title: "Dam Sire:",
                        name:
                            "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.damSireHorseName}"),
                    dataRow(
                        title: "Sires Sire:",
                        name:
                            "${Provider.of<HorseProfileProvider>(context, listen: false).profile!.data!.profile!.siresSireName}"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dataRow({required String title, required String name}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color(0xff6790bb),
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
