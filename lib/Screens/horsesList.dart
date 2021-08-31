import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing_eye/Models/horsesDetailModel.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/Screens/Components/imageplaceHolder.dart';
import 'package:racing_eye/main.dart';

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
                child: Consumer<HorseDetailProvider>(
                  builder: (context, data, _) {
                    print("Data length= ${data.dataModel.length}");
                    return data.dataModel.isNotEmpty
                        ? ListView.builder(
                            itemCount: data.dataModel.length,
                            itemBuilder: (context, index) {
                              return HorseCard(
                                  horseModel: data.dataModel[index]);
                            })
                        : Center(
                            child: Text(
                              ' No horses available',
                              style: TextStyle(
                                  color: myColor.withOpacity(0.5),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
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
