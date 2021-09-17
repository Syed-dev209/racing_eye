import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/OwnerModel/ownerData.dart';
import 'package:racing_eye/Models/ownerSearchStatsModel.dart';
import 'package:racing_eye/main.dart';

class SearchedCard extends StatelessWidget {
  OwnerSearchStatsModel data;
  SearchedCard({required this.data});
  final format = NumberFormat.simpleCurrency(name: "GBP");
  @override
  Widget build(BuildContext context) {
    final image = Provider.of<OwnerDataProvider>(context, listen: false)
        .ownerList
        .where((element) =>
            element.ownerName!.toLowerCase() ==
            data.ownerStyleName!.toLowerCase());

    return Padding(
      padding: EdgeInsets.only(left: 2.0, right: 2.0, bottom: 15.0),
      child: Container(
        height: 214.0,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // CircleAvatar(
                //   radius: 27.0,
                //   backgroundImage: NetworkImage(
                //     "https://www.rp-assets.com/png_silks/${image.first.silkImagePath}.png",
                //   ),
                // ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage( "https://www.rp-assets.com/png_silks/${image.first.silkImagePath}.png",),
                    fit: BoxFit.contain
                    )
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.ownerStyleName!,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 19.0),
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
                            data.countryCode!,
                            style: TextStyle(color: Color(0xff777d80)),
                          )
                        ],
                      ),
                    ],
                  ),
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
                details("Year", data.year!),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Wins", data.wins!.toString()),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Runs", data.runs!.toString()),
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
                details("Wins", "${data.percentWinsRuns}%"),
                SizedBox(
                  width: 9.0,
                ),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Total Earnings",
                    format.format(double.parse(data.earnings!))),
                Container(
                  height: 30.0,
                  width: 2.0,
                  color: Color(0xffe6e6e6),
                ),
                details("Stake", format.format(double.parse(data.stake!))),
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
