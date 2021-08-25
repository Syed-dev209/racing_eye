import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/loginScreen.dart';
import 'package:racing_eye/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  bool checkBoxValue = false;

  bool _hidePassword = true;
  final List<String> items = <String>['1', '2', '3'];
  String selectedItem = '1';
  dynamic radVal = -1;
  bool value = false;

  TextEditingController category = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category.text = 'Select Category';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.08,
                ),
                Text(
                  'Register',
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
                    height: MediaQuery.of(context).size.height * 0.85,
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
                          // SizedBox(
                          //   height: 15.0,
                          // ),

                          Container(
                            height: 70.0,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: myFocusNode.hasFocus
                                    ? Color(0xffF9FAFB)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: TextFormField(
                              onTap: () {
                                setState(() {});
                              },
                              focusNode: myFocusNode,
                              //obscureText: _hidePassword,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  //focusColor: Color(0xff02458A),

                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffBBC3CE))),
                                  labelText: 'User Name',
                                  labelStyle: TextStyle(
                                      fontSize: 16.0,

                                      //color: Color(0xffBBC3CE)
                                      color: myFocusNode.hasFocus
                                          ? Color(0xff02458A)
                                          : Color(0xffBBC3CE)),
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          Container(
                            height: 70.0,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: myFocusNode1.hasFocus
                                    ? Color(0xffF9FAFB)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: TextFormField(
                              onTap: () {
                                setState(() {
                                  myFocusNode.unfocus();
                                  myFocusNode2.unfocus();
                                  myFocusNode3.unfocus();
                                  myFocusNode1.requestFocus();
                                });
                              },
                              focusNode: myFocusNode1,
                              //obscureText: _hidePassword,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  //focusColor: Color(0xff02458A),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffBBC3CE))),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      //color: Color(0xffBBC3CE)
                                      color: myFocusNode1.hasFocus
                                          ? Color(0xff02458A)
                                          : Color(0xffBBC3CE)),
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          Container(
                            height: 70,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: myFocusNode2.hasFocus
                                    ? Color(0xffF9FAFB)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: TextFormField(
                              onTap: () {
                                setState(() {
                                  myFocusNode.unfocus();
                                  myFocusNode1.unfocus();
                                  myFocusNode3.unfocus();
                                  myFocusNode2.requestFocus();
                                });
                              },
                              focusNode: myFocusNode2,
                              //obscureText: _hidePassword,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  //focusColor: Color(0xff02458A),
                                  //suffixIcon: Icon(Icons.circle),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffBBC3CE))),
                                  labelText: 'Phone Number (Optional)',
                                  labelStyle: TextStyle(
                                      fontSize: 16.0,

                                      //color: Color(0xffBBC3CE)
                                      color: myFocusNode2.hasFocus
                                          ? Color(0xff02458A)
                                          : Color(0xffBBC3CE)),
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 70,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: myFocusNode3.hasFocus
                                    ? Color(0xffF9FAFB)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: TextFormField(
                              onTap: () {
                                setState(() {
                                  myFocusNode.unfocus();
                                  myFocusNode1.unfocus();
                                  myFocusNode2.unfocus();
                                  myFocusNode3.requestFocus();
                                });
                              },
                              focusNode: myFocusNode3,
                              obscureText: _hidePassword,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  //focusColor: Color(0xff02458A),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _hidePassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _hidePassword = !_hidePassword;
                                        });
                                      }),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffBBC3CE))),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: myFocusNode3.hasFocus
                                          ? Color(0xff02458A)
                                          : Color(0xffBBC3CE)),
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  hint: Text('Category '),
                                  value: selectedItem,
                                  items: items.map((String item) {
                                    return DropdownMenuItem<String>(
                                      child: Text(
                                        'Log $item',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: item,
                                    );
                                  }).toList(),
                                  onChanged: (String? string) =>
                                      setState(() => selectedItem = string!),
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                            ),
                          ),

                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      side:
                                          BorderSide(color: Color(0xffBBC3CE)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      value: checkBoxValue,
                                      onChanged: (val) {
                                        setState(() {
                                          checkBoxValue = val!;
                                        });
                                      }),
                                  Row(
                                    children: [
                                      Text('I agree with '),
                                      Text(
                                        'Terms and Condition',
                                        style: TextStyle(
                                          color: Color(
                                            0xff02458A,
                                          ),
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Radio(
                                  value: 1,
                                  groupValue: radVal,
                                  onChanged: (value) {
                                    setState(() {
                                      radVal = value;
                                    });
                                  },
                                ),
                                title: Text(
                                  'I don\'t want to receive newsletter',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: size.height * 0.025,
                          // ),
                          SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            height: 45.0,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(23.0))),
                                onPressed: () {},
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                  SizedBox(
                    width: size.height * 0.025,
                  ),
                  Text("OR Continue with"),
                  SizedBox(
                    width: size.height * 0.025,
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                ]),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Center(
                        child: Image.asset('images/google.png'),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Image.asset('images/fb.png'),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Image.asset('images/Apple.png'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have account? ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: Color(
                              0xff02458A,
                            ),
                            fontSize: 18),
                      )
                    ],
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
