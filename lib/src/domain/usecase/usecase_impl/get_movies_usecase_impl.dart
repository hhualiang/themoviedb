import '../../../core/util/data_state.dart';
import '../../../core/util/enum_classes.dart';
import '../../../data/datasource/local/database_repository.dart';
import '../../../data/model/movie_model.dart';
import '../../../data/repository/movie_repository.dart';
import '../../entity/movie.dart';
import '../usecase_interface/i_get_movies_usecase.dart';

class GetMoviesUseCase extends IGetMoviesUseCase {
  final MovieRepository repository;
  final DatabaseRepository dataBaseRepository;

  GetMoviesUseCase({
    required this.repository,
    required this.dataBaseRepository,
  });

  @override
  Future<DataState<List<Movie>>> getMovieList(String category) async {
    final DataState<MovieModel> remoteData =
        await repository.fetchMoviesFromAPI(category);
    if (remoteData.state == BaseState.success) {
      for (Movie movie in remoteData.data!.result) {
        await dataBaseRepository.saveMovie(
          movie,
          category,
        );
      }
      return DataSuccess<List<Movie>>(
        await dataBaseRepository.getSavedMovies(category),
      );
    } else {
      List<Movie> data = await dataBaseRepository.getSavedMovies(category);
      if (data.isNotEmpty) {
        return DataSuccess<List<Movie>>(data);
      } else {
        return DataFailed<List<Movie>>(remoteData.error!);
      }
    }
  }
}
