import '../../../core/util/data_state.dart';
import '../../../data/model/movie_model.dart';

abstract class IGetMoviesUseCase {
  Future<DataState<MovieModel>> getMovieModel(String category);
}
