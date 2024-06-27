import 'package:flutter/material.dart';
import 'package:harry_potter/data/data.dart';
import 'package:harry_potter/widgets/rating.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.characterId});

  final int characterId;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  var lastRatingClicked = 0;

  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter App"),
      ),
      body: Consumer<HogwartsData>(builder: (context, hogwartsData, child) {
        var character = hogwartsData.getCharacter(widget.characterId);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Hero(
                  tag: character.name,
                  child: Image.asset(
                    character.asset,
                    height: totalHeight / 2,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      hogwartsData.toggleFavorite(widget.characterId);
                    },
                    child: (character.favorite)
                        ? Lottie.asset(
                            'assets/anim/heart.json',
                            width: 100,
                            height: 100,
                            repeat: false,
                          )
                        : const SizedBox(
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.favorite_border,
                              size: 48,
                              color: Colors.red,
                            ),
                          ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Rating(value: character.average),
                Text("${character.totalReviews} reviews"),
              ],
            ),
            Rating(
              value: lastRatingClicked,
              color: Colors.deepPurple,
              onStarClicked: (i) {
                lastRatingClicked = i;
                hogwartsData.addReview(widget.characterId, i);
                setState(() {});
              },
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
                    Text(character.strength.toString()),
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
        );
      }),
    );
  }
}
