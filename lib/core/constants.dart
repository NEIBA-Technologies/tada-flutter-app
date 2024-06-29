import 'package:flutter/material.dart';

import 'app_assets_link.dart';
import 'models/assignment.dart';
import 'router_generator.dart';

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

// 0xFFFFA200 #FFA200
Map<int, Color> color3 = {
  50: const Color.fromRGBO(255, 162, 0, .1),
  100: const Color.fromRGBO(255, 162, 0, .2),
  200: const Color.fromRGBO(255, 162, 0, .3),
  300: const Color.fromRGBO(255, 162, 0, .4),
  400: const Color.fromRGBO(255, 162, 0, .5),
  500: const Color.fromRGBO(255, 162, 0, .6),
  600: const Color.fromRGBO(255, 162, 0, .7),
  700: const Color.fromRGBO(255, 162, 0, .8),
  800: const Color.fromRGBO(255, 162, 0, .9),
  900: const Color.fromRGBO(255, 162, 0, 1),
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
  900: const Color.fromRGBO(40, 40, 40, 1),
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
  900: const Color.fromRGBO(72, 80, 94, 1),
};

Color primaryColorLight = const Color.fromRGBO(255, 91, 74, 1);

MaterialColor primaryColor = MaterialColor(0xFFFF5B4A, color0);
MaterialColor yellowColor = MaterialColor(0xFFFFE2B0, color1);
MaterialColor yellowAccentColor = MaterialColor(0xFFFFA200, color3);
MaterialColor greyColor = MaterialColor(0xFF48505E, color2);
MaterialColor blackColor = MaterialColor(0xFF282828, swatchColor);

double padding = 10;
double radius = 12;
const String boxSettings = 'settings';
const String storageTokenSuffix = "jwtToken";
const String storageKey = "mobileTadaV1Application_";
const String storageOnboardingRead = "OnboardingRead";
const String fontPrimary = "Sora";
const String fontSecondary = "Gilroy";

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

final List<Assignment> assignmentContinues = [
  Assignment.fromMap({
    "title": "Mapping spontané",
    "icon": AppAssetLink.cameraSvg,
    "picture": AppAssetLink.mapping,
    "detail": "Enregistrez les points clés dans votre entourage. ",
    "gain": 20,
    "duration": "30 min",
    "time": "5 jour",
    'type':MissionType.Continue,
    "description":
        "Merci de participer à cette mission de visite de magasin. Votre contribution "
            "est essentielle pour nous aider à collecter des informations précises et à jour sur les magasins de nos clients."
            "Veuillez répondre aux questions suivantes avec soin et précision.",
  }),
  Assignment.fromMap({
    "title": "Tâche d’information",
    "icon": AppAssetLink.userStrockSvg,
    "picture": AppAssetLink.tasknew,
    "duration": "30 min",
    "time": "5 jour",
    'type':MissionType.Continue,
    "detail":
        "Epinglé pour avoir toujours de meilleurs informations sur vous. ",
    "description":
        "Merci de participer à cette mission de visite de magasin. Votre contribution "
            "est essentielle pour nous aider à collecter des informations précises et à jour sur les magasins de nos clients."
            "Veuillez répondre aux questions suivantes avec soin et précision.",
    "gain": 5000,
  }),
  Assignment.fromMap({
    "title": "Guide des meilleurs partiques",
    "icon": AppAssetLink.bookopenSvg,
    "picture": AppAssetLink.invinstigation,
    "duration": "30 min",
    "time": "3 jour",
    'type':MissionType.Continue,
    "detail": "Epinglé pour avoir toujours de meilleurs informations sur vous",
    "description":
        "Merci de participer à cette mission de visite de magasin. Votre contribution "
            "est essentielle pour nous aider à collecter des informations précises et à jour sur les magasins de nos clients."
            "Veuillez répondre aux questions suivantes avec soin et précision.",
  }),
];

final List<Assignment> assignmentAvailable = [
  Assignment.fromMap({
    "title": "Enquête terrain",
    "icon": AppAssetLink.alertSvg,
    "detail": "Se rendre dans un magasin pour collecter des données. ",
    "picture": AppAssetLink.invinstigation,
    "gain": 2000,
    "duration": "20 à 30 min",
    "time": "1 jour",
    "favoris": true,
    "route": RouterGenerator.investigationRoute,
    'type':MissionType.Spontaneous,
    "description":
        "Merci de participer à cette mission de visite de magasin. Votre contribution "
            "est essentielle pour nous aider à collecter des informations précises et à jour sur les magasins de nos clients."
            "Veuillez répondre aux questions suivantes avec soin et précision.",
  }),
];
