import 'package:flutter/material.dart';
import 'package:harry_potter/data/data.dart';
import 'package:harry_potter/data/preferences.dart';
import 'package:harry_potter/screens/character_list.dart';
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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Montserrat',
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurpleAccent[100],
            centerTitle: true,
          ),
          useMaterial3: true,
        ),
        home: const CharacterList(),
      ),
    );
  }
}
