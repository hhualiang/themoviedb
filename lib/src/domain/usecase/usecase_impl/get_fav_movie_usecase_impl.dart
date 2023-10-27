import '../../../core/util/data_state.dart';
import '../../entity/movie_genre.dart';
import '../usecase_interface/i_get_genres_usecase.dart';

class GetFavMovieUseCase extends IGetGenresUseCase{
  @override
  Future<DataState<List<MovieGenre>>> getGenreList() {
    // TODO: implement getGenreList
    throw UnimplementedError();
  }

}
