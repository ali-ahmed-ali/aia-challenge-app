import 'package:aia_challenge_app/src/constants/app_sizes.dart';
import 'package:aia_challenge_app/src/constants/color_schemes.g.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme(bool isDark) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: isDark ? defaultDarkColorScheme : defaultLightColorScheme,
    textTheme: customTextTheme,
    fontFamily: 'Helvetica',
  );
}

const TextTheme customTextTheme = TextTheme(
  titleLarge: TextStyle(fontSize: AppSizes.p28, fontWeight: FontWeight.w400),
  displayMedium: TextStyle(fontSize: AppSizes.p16, fontWeight: FontWeight.w500),
  displaySmall: TextStyle(fontSize: AppSizes.p14, fontWeight: FontWeight.w400),
  bodyMedium: TextStyle(fontSize: AppSizes.p16, fontWeight: FontWeight.w400),
  bodyLarge: TextStyle(fontSize: AppSizes.p16, fontWeight: FontWeight.w400),
  bodySmall: TextStyle(fontSize: AppSizes.p14, fontWeight: FontWeight.w700),
);
