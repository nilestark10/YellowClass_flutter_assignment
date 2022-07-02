// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yellowclass/screens/home.dart';

void main() {
  runApp(const YellowClass());
}

class YellowClass extends StatelessWidget {
  const YellowClass({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
