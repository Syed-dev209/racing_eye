import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  FocusNode focusNode;
  FocusNode focusNode1;
  String label;
  TextEditingController controller;
  CustomTextField({required this.controller,required this.focusNode,required this.label,required this.focusNode1});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
      decoration: BoxDecoration(
          color: widget.focusNode.hasFocus?Color(0xffF9FAFB):Colors.white,
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: TextFormField(
        onTap: () {
          setState(() {
            widget.focusNode1.unfocus();
            widget.focusNode.requestFocus();
          });
        },
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xffBBC3CE))),
          labelText: widget.label,
          labelStyle: TextStyle(
              fontSize: 16.0,
              color: widget.focusNode.hasFocus
                  ? Color(0xff02458A)
                  : Color(0xffBBC3CE)),
        ),
      ),
    );
  }
}
