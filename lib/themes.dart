import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyThemes {
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(),
    scaffoldBackgroundColor: HexColor("#121212"),
    cardColor: HexColor('1e1e1e'),
    primaryTextTheme: TextTheme(headline6: TextStyle(fontSize: 40)),
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );

  static final ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.light(),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      cardTheme: CardTheme(
          color: Colors.grey,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue);
}
