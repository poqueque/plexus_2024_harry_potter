import 'package:flutter/material.dart';
import 'package:harry_potter/data/preferences.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:provider/provider.dart';

class TabletPage extends StatefulWidget {
  const TabletPage({super.key});

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  int? characterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/hp_icon.png'),
        ),
        title: const Text("Welcome to Hogwarts"),
        actions: [
          Consumer<Preferences>(builder: (context, preferences, child) {
            return Switch(
              value: preferences.showSubtitles,
              onChanged: (value) {
                preferences.setShowSubtitles(value);
              },
            );
          }),
        ],
      ),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: CharacterList(
                showAppBar: false,
                onTap: (value) {
                  setState(() {
                    characterId = value;
                  });
                },
              )),
          Expanded(
            flex: 2,
            child: (characterId != null)
                ? CharacterDetail(
                    characterId: characterId!,
                    showAppBar: false,
                  )
                : const Center(
                    child: Text("Select a character on the left"),
                  ),
          )
        ],
      ),
    );
  }
}
