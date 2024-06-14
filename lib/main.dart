import 'package:flutter/material.dart';
import 'package:qwerty/splashscreen.dart';
// import 'package:qwerty/formulir.dart';
// import 'package:qwerty/splashscreen.dart';
// import 'package:qwerty/registrasi.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
