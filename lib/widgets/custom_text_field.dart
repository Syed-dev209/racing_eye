// import 'package:flutter/material.dart';
// Widget customTextField({ValueChanged<String> onChanged,Function onClick,required FocusNode myFocusNode,String labelText,required Widget suffixIcon,bool showObscureText}){
//   return TextFormField(
//     onTap: onClick,
//     focusNode: myFocusNode,
//       obscureText: showObscureText,
//     onChanged:onChanged,
//     decoration: InputDecoration(
//       //focusColor: Color(0xff02458A),
//         suffixIcon: suffixIcon,
//         enabledBorder: UnderlineInputBorder(
//             borderSide:
//             BorderSide(color: Color(0xffBBC3CE))),
//         labelText: labelText,
//         labelStyle: TextStyle(
//             fontSize: 16.0,
//
//             //color: Color(0xffBBC3CE)
//             color: myFocusNode.hasFocus ? Color(0xff02458A) : Color(0xffBBC3CE)
//         ),
//         contentPadding: EdgeInsets.zero
//     ),
//   );
//
// }