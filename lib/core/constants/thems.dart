import 'package:flutter/material.dart';

import 'colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme =ThemeData(
  scaffoldBackgroundColor:Colors.black26,
  //HexColor('6B7579'),
  primarySwatch: defualtColor,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,

      iconTheme: IconThemeData(
          color: Colors.white
      ),
      backwardsCompatibility: false,
      backgroundColor: HexColor('6B7579'),
      elevation: 0.0,
      titleTextStyle:TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ) ,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('6B7579'),
        statusBarIconBrightness: Brightness.light ,

      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defualtColor,
      elevation: 20.0,
      backgroundColor: HexColor('6B7579'),
      unselectedItemColor: Colors.grey
  ),
  textTheme: TextTheme(
      headline5:TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
      ),

      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.white
      )
  ),
  fontFamily: 'Janna',

);
ThemeData lightTheme = ThemeData(
  primarySwatch: defualtColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      backwardsCompatibility: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ) ,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark ,

      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defualtColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20.0
  ),
  textTheme: TextTheme(

      headline5:TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
      ),
      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.black
      )
  ),
  fontFamily: 'Janna',


);
