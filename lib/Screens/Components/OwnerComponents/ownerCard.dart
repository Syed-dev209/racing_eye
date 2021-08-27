import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:racing_eye/Models/OwnerModels/ownerData.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';
import 'package:racing_eye/Screens/ownerDetails.dart';

class OwnerCard extends StatelessWidget {
  OwnersData? ownerData;
  bool bgColorWhite;
  String? netAmount="0.00";
  OwnerCard(
      {required this.ownerData,
      this.bgColorWhite = false, this.netAmount});
  final formatCurrency = NumberFormat.simpleCurrency(name: "GBP");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>OwnerDetails(ownerData: ownerData!,)));
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 25.0, right: 10.0, top: 15.0, bottom: 15.0),
        height: 90.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: bgColorWhite ? Colors.white : Color(0xff02468D),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ImagePlaceHolder(
            imagePath: "https://www.rp-assets.com/png_silks/${ownerData!.silkImagePath}.png",
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
                Expanded(
                  flex: 2,
                  child: Text(
                    ownerData!.ownerName!,
                    style: TextStyle(
                        color: bgColorWhite ? Colors.black : Colors.white,
                        fontSize: 18.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                bgColorWhite?Text(''): Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/cup.png',
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'AED ${formatCurrency.format(double.parse(netAmount??"0.00")).substring(1)}',
                      style: TextStyle(
                          color:
                              bgColorWhite ? Colors.black26 : Color(0xff6790BB),
                          fontSize: 15.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.0,
                )
              ],
            ),
          ),
          // SizedBox(
          //   width: 53.0,
          // ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 17.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage("https://www.publicdomainpictures.net/pictures/350000/velka/uae-flag.jpg"),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
