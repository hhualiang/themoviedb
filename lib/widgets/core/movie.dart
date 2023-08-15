class Movie {
  final String title;
  final String releaseDate;
  final String rating;
  final String largePhotoURL;
  final String smallPhotoURL;
  final List<String> genres;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.largePhotoURL,
    required this.smallPhotoURL,
    required this.genres,
  });
}
