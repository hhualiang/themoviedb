import '../../../core/util/data_state.dart';
import '../../../core/util/enum_classes.dart';
import '../../../data/datasource/local/database_repository.dart';
import '../../../data/model/genres_model.dart';
import '../../../data/repository/movie_repository.dart';
import '../../entity/movie_genre.dart';
import '../usecase_interface/i_get_genres_usecase.dart';

class GetGenresUseCase extends IGetGenresUseCase {
  final MovieRepository repository;
  final DatabaseRepository databaseRepository;

  GetGenresUseCase({
    required this.repository,
    required this.databaseRepository,
  });

  @override
  Future<DataState<List<MovieGenre>>> getGenreList() async {
    final DataState<GenreModel> remoteData =
        await repository.fetchGenresFromAPI();
    if (remoteData.state == BaseState.success) {
      await Future.forEach(remoteData.data!.result,
          (MovieGenre movieGenre) async {
        databaseRepository.saveGenre(movieGenre);
      });
      return DataSuccess<List<MovieGenre>>(
        await databaseRepository.getSavedGenres(),
      );
    } else {
      List<MovieGenre> data = await databaseRepository.getSavedGenres();
      if (data.isNotEmpty) {
        return DataSuccess<List<MovieGenre>>(data);
      } else {
        return DataFailed<List<MovieGenre>>(remoteData.error!);
      }
    }
  }
}
