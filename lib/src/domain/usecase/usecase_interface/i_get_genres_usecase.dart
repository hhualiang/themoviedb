import '../../../core/util/data_state.dart';
import '../../entity/movie_genre.dart';

abstract class IGetGenresUseCase {
  Future<DataState<List<MovieGenre>>> getGenreList();
}
