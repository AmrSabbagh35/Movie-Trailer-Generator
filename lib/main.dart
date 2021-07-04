import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'screens/Homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Trailer UI',
      home: Homescreen(),
    );
  }
}
