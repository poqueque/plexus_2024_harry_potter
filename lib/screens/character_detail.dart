import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: character.name,
            child: Image.network(
              character.imageUrl,
              height: totalHeight / 2,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star_border),
                  Icon(Icons.star_border),
                ],
              ),
              Text("89 reviews"),
            ],
          ),
          Text(
            character.name,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.fitness_center),
                  const Text("Fuerza"),
                  Text(character.strenght.toString()),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.auto_fix_normal),
                  const Text("Magia"),
                  Text(character.magic.toString()),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.speed),
                  const Text("Velocidad"),
                  Text(character.speed.toString()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
