import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65.0,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Color(0xff02458A),
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Card(
                  //elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    height: 330,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            onTap: () {
                              setState(() {});
                            },
                            focusNode: myFocusNode,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffBBC3CE))),
                                labelText: 'User Name',
                                labelStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: myFocusNode.hasFocus
                                        ? Color(0xff02458A)
                                        : Color(0xffBBC3CE)),
                                contentPadding: EdgeInsets.zero),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          TextFormField(
                            onTap: () {
                              setState(() {
                                myFocusNode.unfocus();
                                myFocusNode1.requestFocus();
                              });
                            },
                            focusNode: myFocusNode1,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffBBC3CE))),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: myFocusNode1.hasFocus
                                        ? Color(0xff02458A)
                                        : Color(0xffBBC3CE)),
                                contentPadding: EdgeInsets.zero),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  side: BorderSide(color: Color(0xffBBC3CE)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  value: checkBoxValue,
                                  onChanged: (val) {
                                    setState(() {
                                      checkBoxValue = val!;
                                    });
                                  }),
                              Text('Keep me logged in')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
