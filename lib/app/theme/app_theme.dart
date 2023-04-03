import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.cyan[600],
      accentColor: Colors.cyan[300],
      textTheme: TextTheme(headline6: TextStyle(fontSize: 14.0)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.cyan[600],
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),

        )
      ),
      appBarTheme: AppBarTheme(
        elevation: 0, 
      ),
    );
  }
}
