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
          Text(
            "Something went wrong. Check your Internet connection or try again later.",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: myColor),
          ),
          SizedBox(
            height: 15,
          ),
          IconButton(
            onPressed: () {
              // videosController.add(null);
              onReload();
            },
            icon: Icon(Icons.replay),
          )
        ],
      ),
    );
  }
}
