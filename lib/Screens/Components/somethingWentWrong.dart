import 'package:flutter/material.dart';
import 'package:racing_eye/main.dart';

class SomethingWrongWidget extends StatelessWidget {
  final Function onReload;
  const SomethingWrongWidget({Key? key, required this.onReload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/noInternet.png"),
          SizedBox(
            height: 12,
          ),
          Text(
            'Something went wrong. Check your Internet connection.\nTry again later',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                onReload();
              },
              child: Text('Retry'))
        ],
      ),
    );
  }
}
