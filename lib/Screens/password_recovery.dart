import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 65.0,
                ),
                Text(
                  'Recover Password',
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
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Text('Enter Your Email to recover\n password',textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),

                          TextFormField(
                            onTap: (){
                              setState(() {


                              });
                            },
                            focusNode: myFocusNode,
                            onChanged:(value){

                            },
                            decoration: InputDecoration(

                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Color(0xffBBC3CE))),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 16.0,

                                    //color: Color(0xffBBC3CE)
                                    color: myFocusNode.hasFocus ? Color(0xff02458A) : Color(0xffBBC3CE)
                                ),
                                contentPadding: EdgeInsets.zero
                            ),
                          ),





                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color:  Color(0xff02458A),
                                borderRadius: BorderRadius.circular(22)
                            ),
                            child: TextButton(
                              onPressed: (){

                              },
                              child: Text('SUBMIT',style: TextStyle(color: Colors.white),),
                            ),
                          )
                        ],
                      ),
                    ),
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
