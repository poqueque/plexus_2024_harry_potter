class Character {
  final int id;
  final String name;
  final String asset;
  final int strength;
  final int magic;
  final int speed;

  int _totalReviews = 0;
  int _totalStars = 0;
  int get totalReviews => _totalReviews;
  int get totalStars => _totalStars;
  bool favorite = false;

  int get average =>
      (_totalReviews == 0) ? 0 : (_totalStars / _totalReviews).round();

  void addReview(int rate) {
    _totalReviews++;
    _totalStars += rate;
  }

  Character({
    required this.id,
    required this.name,
    required this.asset,
    required this.strength,
    required this.magic,
    required this.speed,
  });
}
