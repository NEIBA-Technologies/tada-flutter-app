import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        BorderSide,
        CheckboxThemeData,
        ColorScheme,
        Colors,
        EdgeInsets,
        IconThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        TextStyle,
        TextTheme,
        ThemeData;
import 'package:flutter/services.dart' show FontWeight, SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../core/constants.dart';

class ThemeCubit extends Cubit<ThemeData> {
  // ThemeCubit(super.initialState);
  ThemeCubit() : super(baseTheme);

  static final baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    // colorSchemeSeed: primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromRGBO(233, 238, 234, 1),
    primaryColor: primaryColor,
    fontFamily: fontPrimary,
    appBarTheme: AppBarTheme(
        elevation: 3,
        shadowColor: Colors.black38,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: primaryColor, size: 20),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: blackColor,
          decorationColor: blackColor,
        )),
    textTheme: TextTheme(
      // titre
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: blackColor,
        decorationColor: blackColor,
      ),
      // sous titre
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: greyColor,
        fontFamily: fontSecondary,
        decorationColor: greyColor,
      ),

      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: fontSecondary,
        color: blackColor,
        decorationColor: blackColor,
      ),

      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: blackColor,
        decorationColor: blackColor,
      ),
      // description
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: blackColor,
        fontFamily: fontSecondary,
        decorationColor: blackColor,
      ),
      // input label
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: greyColor,
        fontFamily: fontSecondary,
        decorationColor: greyColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(8.0),
      hintStyle: TextStyle(
        color: greyColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: greyColor.shade100, width: 1),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: greyColor.shade100, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black12, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor.shade700, width: 1),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(Colors.white),
      checkColor: WidgetStatePropertyAll(primaryColor),
    ),
  );
}
