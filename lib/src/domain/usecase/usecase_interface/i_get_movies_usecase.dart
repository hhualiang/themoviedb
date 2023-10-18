import '../../../core/util/data_state.dart';
import '../../entity/movie.dart';

abstract class IGetMoviesUseCase {
  Future<DataState<List<Movie>>> getMovieList(String category);
}
