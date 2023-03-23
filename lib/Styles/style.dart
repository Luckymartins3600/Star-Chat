import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_app/Utils/const.dart';

class Styles {
  static const kPrimaryColor = Color(0xFF7261EF);
  static const darkPrimaryColor = Color(0x46342F5B);
  static const lightPrimaryColor = Color(0x22A69FDC);
  static const homesystemNavigationBarColor = Colors.white;
  static const white = Colors.white;
  static const black = Colors.black;
  static const black38 = Colors.black38;
  static const red = Colors.red;
  static const kErrorColor = Colors.red;
  static const subtitleTxt = Colors.white38;
  static const kdefaultFamily = 'Numans';
  static const kbgColor = Colors.black;
  static const kSecondaryColor = Color(0xFFFE6601);
  static const kContentColorLightTheme = Colors.white;
  static const kContentColorDarkTheme = Color(0xFF00CF68);
  static const kWarninngColor = Color(0xFF271CF3);
  static String fontFamily = 'Numans';
  static double fontSize = 18;
  static double smallFontSize = 12;
  static double meduimFontSize = 16;
  static double letterSpacing = .5;

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : white,
      primaryColorLight: kPrimaryColor,
      primaryColorDark: kPrimaryColor,
      appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: isDarkTheme ? black : white,
          foregroundColor: isDarkTheme ? white : black,
          systemOverlayStyle: defaultTransparentAppBar()),
      iconTheme: IconThemeData(color: isDarkTheme ? white : black),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
          fontFamily: kdefaultFamily, bodyColor: isDarkTheme ? white : black),
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kPrimaryColor,
        error: kErrorColor,
      ),
      sliderTheme: SliderThemeData(
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 7,
          elevation: .2,
          pressedElevation: 0,
        ),
        overlayShape: SliderComponentShape.noThumb,
        trackShape: const RectangularSliderTrackShape(),
        trackHeight: 3,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: subtitleTxt,
          fontFamily: kdefaultFamily,
        ),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      dividerColor: isDarkTheme ? subtitleTxt : white,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: kPrimaryColor),
      bottomAppBarTheme: BottomAppBarTheme(
        color: isDarkTheme ? black : white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDarkTheme ? black : white,
        selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
        showUnselectedLabels: true,
      ),
    );
  }
}
