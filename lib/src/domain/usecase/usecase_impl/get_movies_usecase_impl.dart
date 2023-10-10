import '../../../core/util/data_state.dart';
import '../../../data/model/movie_model.dart';
import '../../../data/repository/movie_repository.dart';
import '../usecase_interface/i_get_movies_usecase.dart';

class GetMoviesUseCase extends IGetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase({
    required this.repository,
  });

  @override
  Future<DataState<MovieModel>> getMovieModel(String category) async {
    return await repository.fetchMoviesFromAPI(category);
  }
}
