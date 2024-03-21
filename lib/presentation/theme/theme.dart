import 'package:flutter/material.dart';

class CustomColor {
  static const colorPrimary = Color.fromARGB(255, 60, 134, 153); //0x003c8799
  static const onBackground = Color.fromARGB(124, 96, 166, 183); //0x0060A6B7
  static const secundary = Color.fromARGB(253, 18, 96, 113); // 0x00125F71
  static const background = Color.fromARGB(255, 248, 248, 248);
  static const surface = Color.fromARGB(255, 233, 232, 232);
}

ThemeData themeApp = ThemeData(
  useMaterial3: true,
  primaryColor: CustomColor.colorPrimary,
  navigationBarTheme: const NavigationBarThemeData(
    height: 60,
    backgroundColor: CustomColor.surface,
    surfaceTintColor: CustomColor.surface,
    indicatorColor: CustomColor.surface,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    elevation: 2,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColor.background,
  ),
  colorScheme: const ColorScheme.light(
    primary: CustomColor.colorPrimary,
    secondary: CustomColor.secundary, // OnSelected
    onPrimary: CustomColor.colorPrimary,
    onBackground: Color.fromRGBO(96, 166, 183, 0.486),
    background: CustomColor.background,
    onSurface: Colors.grey,
    surface: CustomColor.surface,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: CustomColor.background,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: CustomColor.secundary,
    ),
    displayLarge: TextStyle(
      color: CustomColor.secundary,
      fontWeight: FontWeight.w800,
    ),
  ),
);
