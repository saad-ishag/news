
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  //color of the widgets
  primarySwatch: Colors.lightBlue,
  //color of the appbar and ...
  backgroundColor: Colors.white54,
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: Colors.black,
      //the color of the default text
    ),
    bodyText1: TextStyle(color: Colors.lightBlue),
  ),

  primaryIconTheme: const IconThemeData(
    color: Colors.lightBlue,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white54,
    foregroundColor: Colors.black87,
    actionsIconTheme: IconThemeData(
      color: Colors.lightBlue,
    ),
    // centerTitle: true,
    // automaticallyImplyLeading: false,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //elevation: 2,
    backgroundColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color: Colors.blue,
      //
    ),
    unselectedItemColor: Colors.grey,
  ),
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrangeAccent,
    //primarySwatch: ,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.deepOrangeAccent),
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),

    // iconTheme: IconThemeData(
    //   color: Colors.amber
    // ), // the default theme of icons

    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.deepOrangeAccent,
      ),
      // backgroundColor: Colors.white54,
      //foregroundColor: Colors.black45,
      //centerTitle: true,
      // automaticallyImplyLeading: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[800],
      selectedIconTheme: const IconThemeData(
        color: Colors.deepOrange,
      ),
      unselectedItemColor: Colors.grey,
    ));
