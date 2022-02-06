import 'package:flutter/material.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';
import 'package:racing_eye/Screens/horseDetails.dart';

class HorseCard extends StatelessWidget {
  HorsesDetailModel horseModel;
  HorseCard({required this.horseModel});

  @override
  Widget build(BuildContext context) {
    DateTime parseData = DateTime.parse(horseModel.horseDateOfBirth!);
    DateTime now = DateTime.now();
    int age = now.year - parseData.year;
    //age = (age/365).round();
    // age = int.parse(horseModel.horseAge??"0.0");
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HorseDetails(
                        horseId: horseModel.uid.toString(),
                      )));
        },
        child: Container(
          height: 100.0,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ImagePlaceHolder(
              imagePath:
                  "https://www.rp-assets.com/svg/${horseModel.silkImagePath}.svg",
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 1.0,
                  ),
                  Text(
                    '$age years old, ${horseModel.horseColourCode} ${horseModel.horseSexCode}',
                    style: TextStyle(color: Color(0xff1b5898)),
                  ),
                  Text(
                    horseModel.horseName!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/Stable.png',
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          horseModel.ownerName!,
                          style:
                              TextStyle(color: Colors.black26, fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.0,
                  )
                ],
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.only(right: 4.0, top: 4.0),
            //     child: Align(
            //       alignment: Alignment.topRight,
            //       child: CircleAvatar(
            //         radius: 24.0,
            //         backgroundColor: Colors.white,
            //         backgroundImage: NetworkImage(
            //             "https://www.publicdomainpictures.net/pictures/350000/velka/uae-flag.jpg"),
            //       ),
            //     ),
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}
