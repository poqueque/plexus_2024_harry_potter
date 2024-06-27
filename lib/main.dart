import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/data/data.dart';
import 'package:harry_potter/data/preferences.dart';
import 'package:harry_potter/gen/fonts.gen.dart';
import 'package:harry_potter/screens/adaptive_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HogwartsData()),
        ChangeNotifierProvider(create: (context) => Preferences()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: FontFamily.montserrat,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurpleAccent[100],
            centerTitle: true,
          ),
          useMaterial3: true,
        ),
        home: const AdaptivePage(),
      ),
    );
  }
}
