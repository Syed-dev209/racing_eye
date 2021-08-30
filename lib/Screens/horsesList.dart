import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';

import 'Components/horsecard.dart';

class HorsesList extends StatefulWidget {
  const HorsesList({Key? key}) : super(key: key);

  @override
  _HorsesListState createState() => _HorsesListState();
}

class _HorsesListState extends State<HorsesList> {
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
                height: 45.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return HorseCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
