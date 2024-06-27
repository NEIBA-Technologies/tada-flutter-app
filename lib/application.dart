import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'components/animated_routes/blur_page_route.dart';
import 'core/router_generator.dart';
import 'state_manager/cubits/theme_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Tada',
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: RouterGenerator.indexRoute,
            onUnknownRoute: (settings) {
              return BlurredRouter(
                  builder: ((context) => const Scaffold(
                      body: Center(child: Text("Page non disponible")))));
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('fr'), Locale('en')],
            onGenerateRoute: RouterGenerator.navigate,
          );
        },
      ),
    );
  }
}
