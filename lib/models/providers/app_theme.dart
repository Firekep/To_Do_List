import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme{
    return ThemeData(
      canvasColor: const Color.fromRGBO(155, 22, 61, 1),
      cardColor: Colors.white,
      backgroundColor: Colors.redAccent, //Dismissible Container
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(155, 22, 61, 1),
      ),
      secondaryHeaderColor: const Color.fromRGBO(198, 45, 91, 1), // Buttons Calculator
      disabledColor: Colors.grey,// Calendar circle border
      shadowColor: const Color.fromRGBO(155, 22, 61, 1),//used to button theme
      focusColor: Colors.transparent,//Focus
      iconTheme: const IconThemeData(color: Colors.white),//Icon Color
      primaryColor: Colors.black,//Font Color
      scaffoldBackgroundColor: Colors.white,//Background Color
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromRGBO(209, 36, 113, 1),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hoverColor: Colors.white,
        focusColor: Colors.white,
        contentPadding: EdgeInsets.all(8),
        border: UnderlineInputBorder(),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  static ThemeData get darkTheme{
    return ThemeData(
      canvasColor: Colors.grey[900],// NavegatorAppBar
      cardColor: Colors.blueGrey[800],
      backgroundColor: Colors.lightBlue,// Dismissible color
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],),  //App Bar
      secondaryHeaderColor: Colors.grey[900], // Buttons Calculator
      disabledColor: Colors.black, // Calendar circle border color
      shadowColor: Colors.grey[900], // used to button theme
      focusColor: Colors.transparent,//Focus
      iconTheme: const IconThemeData(color: Colors.white),//Icon Color
      dialogTheme:DialogTheme(
        backgroundColor: Colors.grey[50],),
      primaryColor: Colors.white,// Font Color
      scaffoldBackgroundColor: Colors.blueGrey[800], // Background Color
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black54,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hoverColor: Colors.white,
        focusColor: Colors.white,
        contentPadding: EdgeInsets.all(8),
        border: UnderlineInputBorder(),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
          )),
    );
  }
}