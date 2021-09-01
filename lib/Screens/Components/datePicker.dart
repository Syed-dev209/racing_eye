import 'package:flutter/material.dart';

Future<DateTime?> selectDateAndroid(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  DateTime? picked = DateTime.now();
  picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1990, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Colors.white,
                surface: Theme.of(context).primaryColor,
                onSurface: Colors.black,
              ),
            ),
            child: child!);
      });
  return picked;
}
