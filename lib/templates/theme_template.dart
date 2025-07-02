String themeTemplate() => '''
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color get primaryColor => {{primaryColor}};
  static Color get inversePrimary => Color(primaryColor.value & 0x00FFFFFF | 0xB3000000);
  static Color get errorColor => Colors.red;
  static Color get whiteColor => Colors.white;
  static Color get lightWhite => Colors.white70;
  static Color get blackColor => Colors.black87;
  static Color get lightBlack => Colors.black54;

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        error: errorColor,
        seedColor: primaryColor,
        inversePrimary: inversePrimary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          displayLarge: TextStyle(color: blackColor),
          displayMedium: TextStyle(color: blackColor),
          displaySmall: TextStyle(color: blackColor),
          headlineLarge: TextStyle(color: blackColor),
          headlineMedium: TextStyle(color: blackColor),
          headlineSmall: TextStyle(color: blackColor),
          titleLarge: TextStyle(color: blackColor),
          titleMedium: TextStyle(color: blackColor),
          titleSmall: TextStyle(color: blackColor),
          bodyLarge: TextStyle(color: blackColor),
          bodyMedium: TextStyle(color: blackColor),
          bodySmall: TextStyle(color: lightBlack),
          labelLarge: TextStyle(color: blackColor),
          labelMedium: TextStyle(color: blackColor),
          labelSmall: TextStyle(color: lightBlack),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: inversePrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          maximumSize: Size.fromWidth(MediaQuery.of(context).size.width),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: inversePrimary,
        selectedIconTheme: IconThemeData(color: primaryColor),
        selectedItemColor: primaryColor,
        showSelectedLabels: false,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: inversePrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        titleTextStyle: GoogleFonts.poppins(),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        error: errorColor,
        seedColor: primaryColor,
        inversePrimary: inversePrimary,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: inversePrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          maximumSize: Size.fromWidth(MediaQuery.of(context).size.width),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: inversePrimary,
        selectedIconTheme: IconThemeData(color: primaryColor),
        selectedItemColor: primaryColor,
        showSelectedLabels: false,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          displayLarge: TextStyle(color: whiteColor),
          displayMedium: TextStyle(color: whiteColor),
          displaySmall: TextStyle(color: whiteColor),
          headlineLarge: TextStyle(color: whiteColor),
          headlineMedium: TextStyle(color: whiteColor),
          headlineSmall: TextStyle(color: whiteColor),
          titleLarge: TextStyle(color: whiteColor),
          titleMedium: TextStyle(color: whiteColor),
          titleSmall: TextStyle(color: whiteColor),
          bodyLarge: TextStyle(color: whiteColor),
          bodyMedium: TextStyle(color: whiteColor),
          bodySmall: TextStyle(color: lightWhite),
          labelLarge: TextStyle(color: whiteColor),
          labelMedium: TextStyle(color: whiteColor),
          labelSmall: TextStyle(color: lightWhite),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: inversePrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        titleTextStyle: GoogleFonts.poppins(),
      ),
    );
  }
}
''';
