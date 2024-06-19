import 'package:flutter/material.dart';
import 'package:harry_potter/data/data.dart';
import 'package:harry_potter/screens/character_detail.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Hogwarts"),
      ),
      body: ListView(children: [
        for (var character in Data.characters)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
              title: Text(character.name),
              leading: Hero(
                tag: character.name,
                child: Image.network(character.imageUrl),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterDetail(
                      character: character,
                    ),
                  ),
                );
              },
            ),
          )
      ]),
    );
  }
}
