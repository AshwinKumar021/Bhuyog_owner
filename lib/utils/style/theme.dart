import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: false,
  primaryColor: Style.colors.primary,
  splashColor: Style.colors.primaryfade,
  highlightColor: Style.colors.primary,
  textTheme: TextTheme(
    headline1:
        Style.textStyles.inter(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Style.colors.primary,
    unselectedLabelColor: Style.colors.subtitle,
    labelStyle: Style.textStyles.inter(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: Style.textStyles.inter(
      fontWeight: FontWeight.bold,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: Style.textStyles.inter(
      color: Style.colors.primary,
    ),
    focusColor: Style.colors.primary,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Style.colors.primary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Style.colors.primary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Style.colors.primary,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Style.colors.primary,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Style.colors.primary,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Style.colors.primary,
      ),
    ),
  ),
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(
        secondary: Style.colors.primary,
        primary: Style.colors.primary,
      )
      .copyWith(secondary: Style.colors.primary),
  textSelectionTheme: TextSelectionThemeData(cursorColor: Style.colors.primary),
  // accentIconTheme: ,
);
