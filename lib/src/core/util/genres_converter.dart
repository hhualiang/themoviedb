import '../../domain/entity/movie_genre.dart';

class GenresConverter {
  List<String> getGenresByIds(
    List<int> ids,
    List<MovieGenre>? genresList,
  ) {
    return genresList!
        .where((MovieGenre genres) => ids.contains(genres.id))
        .map((MovieGenre genre) => genre.name)
        .toList();
  }
}
