import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tada/bloc/hovering_bloc.dart';
import 'package:tada/views/splash_creen_1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HoveringBloc(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen1(),
    ),
      );
  }
}
