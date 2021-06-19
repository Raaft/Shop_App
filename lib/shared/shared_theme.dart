/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myshop/shared/Colors.dart';

ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    primarySwatch: blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
        titleTextStyle: TextStyle(
            color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
        //   backgroundColor: Colors.white,
        elevation: 0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        elevation: 30),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)));
ThemeData darkTheme = ThemeData(
  fontFamily: "Quicksand Bold",
    cardColor: HexColor("333739"),
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: HexColor("333739"),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: HexColor("333739"),
        iconTheme: IconThemeData(color: Colors.orange),
        titleTextStyle: TextStyle(
            color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
        elevation: 0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: HexColor("333739"),
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor("333739"),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        elevation: 30),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)));*/




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myshop/shared/Colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',
);