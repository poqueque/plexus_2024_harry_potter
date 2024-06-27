import 'package:flutter/material.dart';
import 'package:harry_potter/gen/assets.gen.dart';
import 'package:harry_potter/models/character.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [
    Character(
      id: 1,
      name: "Harry Potter",
      asset: Assets.images.harry.path,
      strength: 9,
      magic: 9,
      speed: 8,
    ),
    Character(
      id: 2,
      name: "Hermione Granger",
      asset: Assets.images.hermione.path,
      strength: 8,
      magic: 10,
      speed: 9,
    ),
    Character(
      id: 3,
      name: "Ron Weasley",
      asset: Assets.images.ron.path,
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

  void removeReview(int characterId, int rate) {
    var character = getCharacter(characterId);
    character.removeReview(rate);
    notifyListeners();
  }

  void toggleFavorite(int characterId) {
    var character = getCharacter(characterId);
    character.favorite = !character.favorite;
    notifyListeners();
  }
}
