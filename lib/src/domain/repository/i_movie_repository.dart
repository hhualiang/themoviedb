import '../../core/util/data_state.dart';
import '../../data/model/genres_model.dart';
import '../../data/model/movie_model.dart';

abstract class IMovieRepository {
  Future<DataState<MovieModel>> fetchMoviesFromAPI(String category);

  Future<DataState<GenreModel>> fetchGenresFromAPI();
}
