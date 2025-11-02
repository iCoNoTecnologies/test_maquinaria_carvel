import 'package:flutter/material.dart';

class Themes {
  static const int _darkblueValue = 0xFFE91E63;
  static final MaterialColor jhPrimaryColor =  MaterialColor(
      _darkblueValue,
  <int, Color>{
  100: Color.fromARGB(255, 123, 157, 231),
  200: Color.fromARGB(255, 106, 145, 228),
  300: Color.fromARGB(255, 89, 133, 225),
  400: Color.fromARGB(255, 73, 120, 222),
  500: Color.fromARGB(255, 56, 108, 219),
  600: Color.fromARGB(255, 39, 96, 217),
  700: Color.fromARGB(255, 33, 81, 184),
  800: Color.fromARGB(255, 27, 66, 151),
  900: Color.fromARGB(255, 21, 52, 117),
  1000: Color.fromARGB(255, 15, 37, 84),
  });
  static final MaterialColor jhSecondaryColor =  Colors.pink;
  static final MaterialAccentColor jhPrimaryColorAccent =  Colors.indigoAccent;
  static final MaterialAccentColor jhSecondaryColorAccent =  Colors.pinkAccent;

  static final double header1FontSize =  30.0;
  static final double header3FontSize =  25.0;
  static final double baseFontSize =  15.0;

  static final String jhFont =  'Kumbh Sans';

  static final ThemeData jhLight = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: jhFont,
    primaryColor: jhPrimaryColor[1000],
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      errorStyle: TextStyle(color: Colors.red),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
        primary: jhPrimaryColor[1000]!,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        secondary: jhSecondaryColor,
        error: Colors.red),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 4,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: jhPrimaryColor[1000],
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light(primary: jhPrimaryColor),
      height: 50,
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
          color: Colors.black, fontSize: header1FontSize, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          color: Colors.white, fontSize: header1FontSize, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(
          color: Colors.black, fontSize: header3FontSize, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.black, fontSize: baseFontSize),
      bodySmall: TextStyle(color: Colors.white, fontSize: baseFontSize),

    ),
  );


  static final ThemeData jhDark = ThemeData(
    scaffoldBackgroundColor: Colors.black54,
    fontFamily: jhFont,
    primaryColor: jhPrimaryColor[1000],

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      errorStyle: TextStyle(color: Colors.red),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
        primary: jhPrimaryColor[1000]!,
        onPrimary: Colors.black45,
        onSecondary: Color(0xFF1C1C1C),
        secondary: jhSecondaryColor,
        error: Colors.red),
    cardTheme: CardThemeData(
      color: Colors.black87,
      elevation: 4,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: jhPrimaryColor[1000],
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light(primary: jhPrimaryColor),
      height: 50,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
          color: Colors.white, fontSize: header1FontSize, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          color: Colors.white, fontSize: header1FontSize, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(
          color: Colors.white, fontSize: header3FontSize, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.white, fontSize: baseFontSize),
      bodySmall: TextStyle(color: Colors.black87, fontSize: baseFontSize),
    ),
  );
}
