import 'package:flutter/material.dart';


///--------Light-Mode----------------------
ThemeData? lightMode = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(
      color: Colors.black,
    ),
    showUnselectedLabels: true,
    selectedIconTheme: IconThemeData(color: Colors.black),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w700),
      iconTheme: IconThemeData(color: Colors.black)),
  backgroundColor: Colors.white,
);
///--------Dark-Mode----------------------
ThemeData? darkMode =  ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
    showUnselectedLabels: true,
    selectedIconTheme: IconThemeData(color: Colors.white),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Colors.black,
);