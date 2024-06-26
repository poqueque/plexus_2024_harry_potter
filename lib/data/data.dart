import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [
    Character(
      id: 1,
      name: "Harry Potter",
      imageUrl:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1000?cb=20160903184919",
      strength: 9,
      magic: 9,
      speed: 8,
    ),
    Character(
      id: 2,
      name: "Hermione Granger",
      imageUrl:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1200?cb=20120729103114&path-prefix=es",
      strength: 8,
      magic: 10,
      speed: 9,
    ),
    Character(
      id: 3,
      name: "Ron Weasley",
      imageUrl:
          "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/1000?cb=20150523213430",
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
