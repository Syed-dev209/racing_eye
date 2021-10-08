import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DashboardStatsCard extends StatelessWidget {
  String title, value;
  DashboardStatsCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff1b5998),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 90.0,
        width: 120.0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ([
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff8daccc),
                    ),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    value,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0),
                    softWrap: true,
                    //overflow: TextOverflow.clip
                    minFontSize: 15,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
