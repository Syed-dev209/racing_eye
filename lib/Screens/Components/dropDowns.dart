import 'package:flutter/material.dart';
import 'package:racing_eye/main.dart';

Widget dropDownAndroid(List data, String selectedValue, Function onChanged) {
  return DropdownButton(
    elevation: 8,
    style: TextStyle(
        fontWeight: FontWeight.w400, color: Colors.black, fontSize: 17.0),
    icon: Icon(
      Icons.keyboard_arrow_down_sharp,
      color: myColor.shade50,
    ),
    isExpanded: true,
    value: selectedValue,
    onChanged: (newValue) {
      onChanged(newValue);
      print(newValue);
    },
    items: [
      for (var i in data)
        DropdownMenuItem(
          value: i,
          child: Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Text(i.toString()),
          ),
        )
    ],
  );
}
