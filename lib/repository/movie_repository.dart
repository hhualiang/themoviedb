import 'movie_data_class.dart';
import 'movie_genres_data_class.dart';

abstract class MovieRepository {
  Future<List<MovieFile>> getMovies();

  Future<List<MovieGenres>> getGenres();

  Future<List<String>> getGenresByIds(List<int> ids);
}
