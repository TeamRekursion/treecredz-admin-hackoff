import 'package:flutter/material.dart';

const lightGreen = Color(0xFF77C042);
const mediumGreen = Color(0xFF3EAA44);
const darkGreen = Color(0xFF006400);
const veryLightGrey = Color(0xFFF8F8F8);
const lightGrey = Color(0xFFF3F3F3);
const backgroundGreen = Color(0xFFF6FeF6);
const cardColor = Color(0xFFe8fce8);

final cardRadius10 = BorderRadius.circular(10);

final pageTransition = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  },
);

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Rubik',
  accentColor: lightGreen,
  primaryColor: mediumGreen,
  primaryColorDark: darkGreen,
  scaffoldBackgroundColor: backgroundGreen,
  cardColor: cardColor,
  applyElevationOverlayColor: true,
  brightness: Brightness.light,
  pageTransitionsTheme: pageTransition,
);
