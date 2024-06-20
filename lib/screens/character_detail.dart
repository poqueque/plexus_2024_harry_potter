import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: widget.character.name,
            child: Image.network(
              widget.character.imageUrl,
              height: totalHeight / 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Rating(value: widget.character.average),
              Text("${widget.character.totalReviews} reviews"),
            ],
          ),
          Rating(
            value: lastRatingClicked,
            color: Colors.deepPurple,
            onStarClicked: (i) {
              lastRatingClicked = i;
              widget.character.totalReviews++;
              widget.character.totalStars += i;
              setState(() {});
            },
          ),
          Text(
            widget.character.name,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.fitness_center),
                  const Text("Fuerza"),
                  Text(widget.character.strength.toString()),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.auto_fix_normal),
                  const Text("Magia"),
                  Text(widget.character.magic.toString()),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.speed),
                  const Text("Velocidad"),
                  Text(widget.character.speed.toString()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
