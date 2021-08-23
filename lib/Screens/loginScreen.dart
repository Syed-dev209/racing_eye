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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
            height: MediaQuery.of(context).size.height*0.964,
            width:  MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding:EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xff02458A),
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Card(
                  //elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    height: 320,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70.0,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: myFocusNode.hasFocus?Color(0xffF9FAFB):Colors.white,
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: TextFormField(
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
                                  ),
                            ),
                          ),
                          Container(
                            height: 70.0,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: myFocusNode1.hasFocus?Color(0xffF9FAFB):Colors.white,
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: TextFormField(
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
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height:20.0,
                                width: 20.0,
                                child: Checkbox(
                                    side: BorderSide(color: Color(0xffBBC3CE)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0)),
                                    value: checkBoxValue,
                                    onChanged: (val) {
                                      setState(() {
                                        checkBoxValue = val!;
                                      });
                                    },
                                  splashRadius: 0.0,
                                ),
                              ),
                              SizedBox(width: 12.0,),
                              Text('Keep me logged in',style: TextStyle(
                                fontSize: 12.0
                              ),)
                            ],
                          ),
                          SizedBox(height: 32.0,),
                          SizedBox(
                            width: double.maxFinite,
                            height: 45.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23.0)
                                )
                              ),
                                onPressed: (){},
                                child: Text('Login',style: TextStyle(
                              color: Colors.white,
                                  fontSize: 16.0
                            ),),),
                          ),
                          SizedBox(height: 13.0,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              child: Text('Forgot Password?'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50.0,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2.0,
                        width: 500,
                        decoration: BoxDecoration(
                            color: Color(0xffF0F0F8),
                            borderRadius: BorderRadius.circular(2.0)
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Text('or continue with'),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: Container(
                        height: 2.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Color(0xffF0F0F8),
                          borderRadius: BorderRadius.circular(2.0)
                        ),

                      ),
                    ),

                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 55.0,
                        width: 55.0,
                        child: Image.asset('images/google.png')
                    ),
                    SizedBox(width: 15.0,),
                    Container(
                      height: 43.0,
                        width: 43.0,
                        child: Image.asset('images/fb.png')),
                    SizedBox(width: 25.0,),
                    Container(
                        height: 43.0,
                        width: 43.0,child: Image.asset('images/Apple.png'))
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Center(
                    child: RichText(
                      text:
                      TextSpan(
                          text:'Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0
                          ),
                          children: [
                      TextSpan(
                        text: '   Sign In',
                        style: TextStyle(
                            color: Color(0xFF02458A),
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ]),),
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
