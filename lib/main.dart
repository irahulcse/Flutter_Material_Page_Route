import 'package:connecting_world_of_flutter/parsing_json/parsing_json.dart';
import 'package:flutter/material.dart';
import 'package:connecting_world_of_flutter/util/colors.dart';

final ThemeData _mortgageTheme = _buildMortgageTheme();

ThemeData _buildMortgageTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
      accentColor: primaryIndigoDark,
      primaryColor: primaryIndigo200,
      scaffoldBackgroundColor: secondaryBackgroundWhite,
      hintColor: textOnPrimaryBlack,
      cardColor: secondaryDeepPurple,
      textTheme: _buildMortgageTextTheme(base.textTheme),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: primaryIndigoLight),
              borderRadius: BorderRadius.circular(12))),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
          elevation: 7,
          splashColor: primaryIndigoLight,
          backgroundColor: secondaryDeepPurple));
}

_buildMortgageTextTheme(TextTheme base) {
  return base
      .copyWith(
        body1: TextStyle(color: textOnPrimaryBlack, fontSize: 16),
      )
      .apply(
        fontFamily: "Lobster",
      );
}

void main() => runApp(
      new MaterialApp(
        home: JsonParsing(),
        debugShowCheckedModeBanner: false,
        theme: _buildMortgageTheme(),
      ),
    );
