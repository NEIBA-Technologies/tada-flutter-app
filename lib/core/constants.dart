import 'package:flutter/material.dart';
import 'package:tada/core/app_assets_link.dart';


// 0xFFFF5B4A  #FF5B4A;
Map<int, Color> color0 = {
  50: const Color.fromRGBO(255, 91, 74, .1),
  100: const Color.fromRGBO(255, 91, 74, .2),
  200: const Color.fromRGBO(255, 91, 74, .3),
  300: const Color.fromRGBO(255, 91, 74, .4),
  400: const Color.fromRGBO(255, 91, 74, .5),
  500: const Color.fromRGBO(255, 91, 74, .6),
  600: const Color.fromRGBO(255, 91, 74, .7),
  700: const Color.fromRGBO(255, 91, 74, .8),
  800: const Color.fromRGBO(255, 91, 74, .9),
  900: const Color.fromRGBO(255, 91, 74, 1),
};

// 0xFFFFE2B0 #FFE2B0
Map<int, Color> color1 = {
  50: const Color.fromRGBO(255, 226, 176, .1),
  100: const Color.fromRGBO(255, 226, 176, .2),
  200: const Color.fromRGBO(255, 226, 176, .3),
  300: const Color.fromRGBO(255, 226, 176, .4),
  400: const Color.fromRGBO(255, 226, 176, .5),
  500: const Color.fromRGBO(255, 226, 176, .6),
  600: const Color.fromRGBO(255, 226, 176, .7),
  700: const Color.fromRGBO(255, 226, 176, .8),
  800: const Color.fromRGBO(255, 226, 176, .9),
  900: const Color.fromRGBO(255, 226, 176, 1),
};

// 0xFF282828 #282828
Map<int, Color> swatchColor = {
  50: const Color.fromRGBO(40, 40, 40, .1),
  100: const Color.fromRGBO(40, 40, 40, .2),
  200: const Color.fromRGBO(40, 40, 40, .3),
  300: const Color.fromRGBO(40, 40, 40, .4),
  400: const Color.fromRGBO(40, 40, 40, .5),
  500: const Color.fromRGBO(40, 40, 40, .6),
  600: const Color.fromRGBO(40, 40, 40, .7),
  700: const Color.fromRGBO(40, 40, 40, .8),
  800: const Color.fromRGBO(40, 40, 40, .9),
  900: const Color.fromRGBO(40, 40, 40,  1),
};

// 0xFF48505E #48505E
Map<int, Color> color2 = {
  50: const Color.fromRGBO(72, 80, 94, .1),
  100: const Color.fromRGBO(72, 80, 94, .2),
  200: const Color.fromRGBO(72, 80, 94, .3),
  300: const Color.fromRGBO(72, 80, 94, .4),
  400: const Color.fromRGBO(72, 80, 94, .5),
  500: const Color.fromRGBO(72, 80, 94, .6),
  600: const Color.fromRGBO(72, 80, 94, .7),
  700: const Color.fromRGBO(72, 80, 94, .8),
  800: const Color.fromRGBO(72, 80, 94, .9),
  900: const Color.fromRGBO(72, 80, 94,  1),
};



Color primaryColorLight = const Color.fromRGBO(255, 91, 74, 1);

MaterialColor primaryColor = MaterialColor(0xFFFF5B4A, color0);
MaterialColor yellowColor = MaterialColor(0xFFFFE2B0, color1);
MaterialColor blackColor = MaterialColor(0xFF282828, swatchColor);
MaterialColor greyColor = MaterialColor(0xFF48505E, color2);

double padding = 10;
double radius = 12;
const String boxSettings = 'settings';

List<BoxShadow> boxShadowSM = [
  const BoxShadow(
    color: Colors.black12,
    spreadRadius: 0,
    blurRadius: 2,
  ),
  BoxShadow(
    color: Colors.black12.withOpacity(.01),
    spreadRadius: 1,
    blurRadius: 5,
  )
];


