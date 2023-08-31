class MovieGenres {
  final int id;
  final String name;

  MovieGenres({
    required this.id,
    required this.name,
  });

  factory MovieGenres.fromJson(Map<String, dynamic> json) {
    return MovieGenres(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
