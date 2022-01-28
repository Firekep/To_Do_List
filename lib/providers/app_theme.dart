import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme{
    return ThemeData(
      disabledColor: Colors.black,
      primaryColorLight: Colors.white,
      backgroundColor: Colors.redAccent,
      iconTheme: const IconThemeData(color: Colors.white),
      primaryColor: Colors.black,
      shadowColor: const Color.fromRGBO(155, 22, 61, 1),//used to button theme
      focusColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(155, 22, 61, 1),
      ),
      primarySwatch: Colors.teal,
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
      disabledColor: Colors.black,
      primaryColorDark: Colors.black,
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(1,1,1,0.9),
      //       )
      //   )
      // ),
      primaryColorLight: Colors.white,
      shadowColor: Colors.black, // used to button theme
      focusColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.grey[800],
        titleTextStyle:
        const TextStyle(color: Colors.white, fontSize: 20),
      ),
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,),
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.blueGrey,
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