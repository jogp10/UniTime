import 'package:flutter/material.dart';

const Color _darkBlue = Color.fromARGB(255, 0x17, 0x1C, 0x75);
const Color _lightBlue = Color.fromARGB(255, 46, 151, 226);
const Color _mildBlack = Color.fromARGB(255, 0x1a, 0x18, 0x18);
const Color _lightGrey = Color.fromARGB(255, 215, 215, 215);
const Color _grey = Color.fromARGB(255, 0x7f, 0x7f, 0x7f);
const Color _strongGrey = Color.fromARGB(255, 90, 90, 90);
const Color _mildWhite = Color.fromARGB(255, 0xDC, 0xDC, 0xDC);

ThemeData applicationLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  dividerColor: _lightGrey,
  hintColor: _lightGrey,
  backgroundColor: _mildBlack,
  scaffoldBackgroundColor: _mildBlack,
  textTheme: TextTheme(
    headline1:
        TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: _darkBlue),
    headline2: TextStyle(
        fontSize: 17.0, color: _mildWhite, fontWeight: FontWeight.w300),
    headline3: TextStyle(
        fontSize: 17.0, color: _lightBlue, fontWeight: FontWeight.w300),
    headline4: TextStyle(
        fontSize: 17.0, color: _mildWhite, fontWeight: FontWeight.w300),
    headline5: TextStyle(
        fontSize: 17.0, color: _mildWhite, fontWeight: FontWeight.w400),
    headline6: TextStyle(
        fontSize: 17.0, color: _mildWhite, fontWeight: FontWeight.w300),
    subtitle1:
        TextStyle(fontSize: 17.0, color: _grey, fontWeight: FontWeight.w300),
    subtitle2:
        TextStyle(fontSize: 16.0, color: _grey, fontWeight: FontWeight.w300),
    bodyText1: TextStyle(fontSize: 16.0, color: _mildWhite),
    bodyText2: TextStyle(fontSize: 15.0, color: _mildWhite),
    caption:
        TextStyle(fontSize: 12.0, color: _grey, fontWeight: FontWeight.w500),
  ),
  iconTheme: IconThemeData(color: _strongGrey),
  unselectedWidgetColor: _grey,
  toggleableActiveColor: _darkBlue,
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: _strongGrey,
    labelColor: _strongGrey,
    labelPadding: EdgeInsets.all(0.0),
  ),
  canvasColor: _mildBlack,
  cardColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: _darkBlue,
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0)),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: _darkBlue,
          textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400))),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.black),
    fillColor: MaterialStateColor.resolveWith(
      (states) {
      if (states.contains(MaterialState.selected)) {
        return _darkBlue; // the color when checkbox is selected;
      }
      return _grey; //the color when checkbox is unselected;
      },
    )
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _darkBlue)
);