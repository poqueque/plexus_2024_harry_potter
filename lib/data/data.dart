import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [
    Character(
      id: 1,
      name: "Harry Potter",
      asset: "assets/images/harry.png",
      strength: 9,
      magic: 9,
      speed: 8,
    ),
    Character(
      id: 2,
      name: "Hermione Granger",
      asset: "assets/images/hermione.png",
      strength: 8,
      magic: 10,
      speed: 9,
    ),
    Character(
      id: 3,
      name: "Ron Weasley",
      asset: "assets/images/ron.png",
      strength: 10,
      magic: 6,
      speed: 7,
    ),
  ];

  Character getCharacter(int id) {
    return characters.firstWhere((c) => c.id == id);
  }

  void addReview(int characterId, int rate) {
    var character = getCharacter(characterId);
    character.addReview(rate);
    notifyListeners();
  }

  void toggleFavorite(int characterId) {
    var character = getCharacter(characterId);
    character.favorite = !character.favorite;
    notifyListeners();
  }
}
