import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opexq/utils/configuration.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey.shade200,
  primaryColorLight: kPrimaryColor,
  colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      onPrimary: Colors.white),
  backgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87, size: 24)),
  textTheme: //myTextTheme(),
      GoogleFonts.quicksandTextTheme(const TextTheme(
    headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 30.0),
    headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
    headline4: TextStyle(fontSize: 24.0),
    headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 20.0),
    subtitle1: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black87),
    subtitle2: TextStyle(fontSize: 16.0),
    bodyText1: TextStyle(fontSize: 14.0),
    bodyText2: TextStyle(fontSize: 12.0),
  )),
  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //   backgroundColor: Colors.white,
  //   unselectedItemColor: Colors.black,
  //   selectedItemColor: Colors.redAccent,
  //   elevation: 0,
  // ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(8),
    alignLabelWithHint: true,
    isDense: true,
    isCollapsed: true,
    // fillColor: Colors.white,
    // filled: true,
    labelStyle: const TextStyle(fontSize: 16.0),
    hintStyle: const TextStyle(height: 20, fontWeight: FontWeight.bold),
    // focusedBorder: const OutlineInputBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //   borderSide: BorderSide.none,
    // ),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: lightgrey)),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: lightgrey),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: lightgrey),
    ),
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  dividerColor: Colors.transparent,
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0XFF1D2E50),
    shape: RoundedRectangleBorder(),
    textTheme: ButtonTextTheme.accent,
  ),
  // appBarTheme: const AppBarTheme(
  //   color: Colors.white,
  //   elevation: 0,
  //   textTheme: TextTheme(
  //     headline6: TextStyle(
  //       color: Colors.black,
  //       fontSize: 20,
  //     ),
  //   ),
  // ),
);

          //primaryColor: kPrimaryColor, //Color(0XFFB98D4A), //0xFFF1F1F1
          //secondaryHeaderColor: kSecondaryColor, //Color(0XFF1D2E50),
          //scaffoldBackgroundColor: Colors.grey[100],
          //primarySwatch: Colors.blue,
          
          // buttonTheme: const ButtonThemeData(
          //   buttonColor: Color(0XFF1D2E50),
          //   shape: RoundedRectangleBorder(),
          //   textTheme: ButtonTextTheme.accent,
          // ),
          
          //fontFamily: 'QuickSand',
          //scaffoldBackgroundColor: AppColors.blue,
          //primarySwatch: Colors.blue,
          //visualDensity: VisualDensity.adaptivePlatformDensity
        