class Character {
  final String name;
  final String imageUrl;
  final int strength;
  final int magic;
  final int speed;

  int totalReviews = 0;
  int totalStars = 0;

  int get average =>
      (totalReviews == 0) ? 0 : (totalStars / totalReviews).round();

  Character({
    required this.name,
    required this.imageUrl,
    required this.strength,
    required this.magic,
    required this.speed,
  });
}
