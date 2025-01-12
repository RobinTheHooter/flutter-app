class Movie {
  final int id;
  final String name;
  final String? summary;
  final String? imageUrl;
  final double? rating;
  final String? genres;
  final String? premiered;

  Movie({
    required this.id,
    required this.name,
    this.summary,
    this.imageUrl,
    this.rating,
    this.genres,
    this.premiered,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final show = json['show'];
    return Movie(
      id: show['id'],
      name: show['name'],
      summary: show['summary'],
      imageUrl: show['image']?['medium'],
      rating: show['rating']?['average']?.toDouble(),
      genres: show['genres']?.join(', '),
      premiered: show['premiered'],
    );
  }
}
