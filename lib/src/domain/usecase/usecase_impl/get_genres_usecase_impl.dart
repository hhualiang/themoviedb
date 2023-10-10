import '../../../core/util/data_state.dart';
import '../../../data/model/genres_model.dart';
import '../../../data/repository/movie_repository.dart';
import '../usecase_interface/i_get_genres_usecase.dart';

class GetGenresUseCase extends IGetGenresUseCase {
  final MovieRepository repository;

  GetGenresUseCase({
    required this.repository,
  });

  @override
  Future<DataState<GenreModel>> getGenresModel() async {
    return await repository.fetchGenresFromAPI();
  }
}
