import 'package:coffe_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    // scrollbarTheme: ScrollbarThemeData(
    //     trackBorderColor: MaterialStateProperty.all(Colors.red),
    //     trackColor: MaterialStateProperty.all(Colors.black)),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        )),
    indicatorColor: Colors.black,
    primaryColor: mPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
actionsIconTheme: IconThemeData(
  color: Colors.black,
),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
    ));
// ThemeData darkTheme = ThemeData(
//     textTheme: TextTheme(
//       bodyText1: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//       ),
//       bodyText2: TextStyle(
//         color: Colors.white,
//         fontSize: 16.0,
//       ),
//     ),
//     indicatorColor: Colors.deepOrange,
//     primarySwatch: mPrimaryColor,
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: AppBarTheme(
//       iconTheme: IconThemeData(color: Colors.black),
//       // actionsIconTheme: IconThemeData(
//       //   color: Colors.white,
//       // ),
//       backwardsCompatibility: false,
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: Colors.orangeAccent,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//       backgroundColor: Colors.grey,
//       elevation: 0.0,
//       centerTitle: true,
//       titleTextStyle: TextStyle(
//           color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
//     ));
