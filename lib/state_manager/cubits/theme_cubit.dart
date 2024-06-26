import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        BorderSide,
        BottomSheetThemeData,
        CardTheme,
        CheckboxThemeData,
        ChipThemeData,
        ColorScheme,
        Colors,
        DropdownMenuThemeData,
        EdgeInsets,
        ExpansionTileThemeData,
        IconThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        ProgressIndicatorThemeData,
        RadioThemeData,
        TabAlignment,
        TabBarIndicatorSize,
        TabBarTheme,
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
      useMaterial3: true,
      brightness: Brightness.light,
      dividerColor: greyColor.shade100,
      scaffoldBackgroundColor: const Color.fromRGBO(233, 238, 234, 1),
      primaryColor: primaryColor,
      fontFamily: fontPrimary,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
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
          iconTheme: IconThemeData(color: primaryColor, size: 18),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
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
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor.shade700, width: 1),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: const WidgetStatePropertyAll(Colors.white),
        checkColor: WidgetStatePropertyAll(primaryColor),
      ),
      tabBarTheme: TabBarTheme(
        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.symmetric(horizontal: 1.5),
        dividerColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: blackColor,
        labelColor: blackColor,
        unselectedLabelColor: greyColor.shade200,
      ),
      cardTheme: const CardTheme(
        elevation: 2,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: primaryColor,
        linearTrackColor: greyColor.shade100,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: blackColor,
        collapsedBackgroundColor: Colors.white,
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(primaryColor),
        splashRadius: 8,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          iconColor: blackColor,
          fillColor: Colors.transparent,
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
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: primaryColor.shade700, width: 1),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
          selectedColor: primaryColor,
          backgroundColor: greyColor.shade50,
          side: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          )));
}
