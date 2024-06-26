import 'package:flutter/material.dart';
import 'package:harry_potter/data/data.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HogwartsData>(
      builder: (context, hogwartsData, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Welcome to Hogwarts"),
          ),
          body: ListView(children: [
            for (var character in hogwartsData.characters)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: ListTile(
                  title: Text(character.name),
                  subtitle: Text("Reviews: ${character.totalReviews}"),
                  leading: Hero(
                    tag: character.name,
                    child: Image.network(character.imageUrl),
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
  }
}
