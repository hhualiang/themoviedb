import '../entity/movie.dart';
import '../entity/movie_genre.dart';

abstract class IDatabaseRepository {
  Future<List<Movie>> getSavedMovies(String category);

  Future<void> saveMovie(
    Movie movie,
    String category,
  );

  Future<Movie?> existMovie(Movie movie);

  Future<List<MovieGenre>> getSavedGenres();

  Future<void> saveGenre(MovieGenre movieGenre);

  Future<void> deleteGenre();
}
