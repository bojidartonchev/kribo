import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static const Color background = Color(0xffF3F4F6);
  static const Color primary = Color(0xff5ec792);
  static const Color primaryLight = Colors.lightGreen;
  static const Color card = Colors.white;
  static const Color title = Colors.black54;
  static const Color subtitle = Color(0xff909090);

  static ThemeData theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: background,
      primaryColorDark: primary,
      scaffoldBackgroundColor: background,
      colorScheme:
          const ColorScheme.light(primary: primary, secondary: primaryLight),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: title),
      iconTheme: const IconThemeData(color: title),
      textTheme: GoogleFonts.nunitoTextTheme()
          .apply(bodyColor: title, displayColor: title)
          .copyWith(
              subtitle1: const TextStyle(color: title),
              caption: const TextStyle(color: subtitle)),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      cardTheme: const CardTheme(
          elevation: 2,
          color: card,
          margin: EdgeInsets.all(4),
          shadowColor: Colors.black12,
          clipBehavior: Clip.antiAliasWithSaveLayer),
      tooltipTheme: const TooltipThemeData(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          textStyle: TextStyle(color: Colors.transparent)),
      appBarTheme: const AppBarTheme(
          toolbarHeight: 70,
          color: card,
          iconTheme: IconThemeData(color: title),
          shadowColor: Colors.black12,
          elevation: 4),
      dividerTheme: DividerThemeData(
        color: title.withOpacity(0.2),
        thickness: 0,
        endIndent: 0,
        indent: 0,
      ),
      scrollbarTheme: ScrollbarThemeData(
          isAlwaysShown: false,
          showTrackOnHover: false,
          thumbColor: MaterialStateProperty.all(primary),
          thickness: MaterialStateProperty.all(5)));
}
