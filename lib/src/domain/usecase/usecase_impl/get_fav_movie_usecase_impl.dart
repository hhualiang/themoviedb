import '../../../core/util/data_state.dart';
import '../../../data/datasource/local/database_repository.dart';
import '../../entity/movie.dart';
import '../usecase_interface/i_get_fav_movie_usecase.dart';

class GetFavMovieUseCase extends IGetFavMovieUseCase {
  final DatabaseRepository databaseRepository;
  static const String _emptyMessage = 'You have no favourite movies yet!';

  GetFavMovieUseCase({
    required this.databaseRepository,
  });

  @override
  Future<DataState<List<Movie>>> getFavMovie() async {
    List<Movie> data = await databaseRepository.getFavMovies();
    if (data.isNotEmpty) {
      return DataSuccess<List<Movie>>(data);
    } else {
      return DataFailed<List<Movie>>(_emptyMessage);
    }
  }
}
