import 'package:flutter/material.dart';

class DashboardContentCard extends StatelessWidget {
  String title, imagePath;
  Widget goToPage;
  DashboardContentCard(
      {required this.title, required this.imagePath, required this.goToPage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => goToPage));
        },
        child: Container(
          height: (MediaQuery.of(context).size.height * 0.58) / 3,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex: 3, child: Image.asset(imagePath)),
                Expanded(
                  child: Text(
                    title,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
