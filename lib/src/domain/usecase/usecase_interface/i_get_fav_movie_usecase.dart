import '../../../core/util/data_state.dart';
import '../../entity/movie.dart';

abstract class IGetFavMovieUseCase {
  Future<DataState<List<Movie>>> getFavMovie();
}
