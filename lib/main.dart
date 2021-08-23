import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/loginScreen.dart';
import 'package:racing_eye/Screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

const MaterialColor myColor = const MaterialColor(0xFF02458A, <int, Color>{
  50: Color(0xFF02458A),
  100: Color(0xFF02458A),
  200: Color(0xFF02458A),
  300: Color(0xFF02458A),
  400: Color(0xFF02458A),
  500: Color(0xFF02458A),
  600: Color(0xFF02458A),
  700: Color(0xFF02458A),
  800: Color(0xFF02458A),
  900: Color(0xFF02458A)
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Racing Eye',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: RegisterScreen(),
    );
  }
}
