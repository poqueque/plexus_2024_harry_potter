import 'package:flutter/material.dart';
import 'package:harry_potter/data/data.dart';
import 'package:harry_potter/data/preferences.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Preferences>(builder: (context, preferences, child) {
      return Consumer<HogwartsData>(
        builder: (context, hogwartsData, child) {
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/hp_icon.png'),
              ),
              title: const Text("Welcome to Hogwarts"),
              actions: [
                Switch(
                  value: preferences.showSubtitles,
                  onChanged: (value) {
                    preferences.setShowSubtitles(value);
                  },
                ),
              ],
            ),
            body: ListView(children: [
              for (var character in hogwartsData.characters)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                    title: Text(character.name),
                    subtitle: preferences.showSubtitles
                        ? Text("Reviews: ${character.totalReviews}")
                        : null,
                    leading: Hero(
                      tag: character.name,
                      child: Image.asset(character.asset),
                    ),
                    trailing: Icon(character.favorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetail(
                            characterId: character.id,
                          ),
                        ),
                      );
                    },
                  ),
                )
            ]),
          );
        },
      );
    });
  }
}
