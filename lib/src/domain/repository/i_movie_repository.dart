import '../entity/movie.dart';
import '../entity/movie_genre.dart';

abstract class IMovieRepository {
  Future<List<Movie>> getMovies();

  Future<List<MovieGenre>> getGenres();

  Future<List<String>> getGenresByIds(List<int> ids);
}
