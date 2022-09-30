import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.green;

  static ThemeData appTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      appBarTheme: AppBarTheme(color: primary),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.primary
        )
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape: const StadiumBorder(),
          elevation: 0,
        )
      ),

      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle( color: primary),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(20)
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(20)
          )
        ),

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(20)
          )
        )

      )
    );
}
