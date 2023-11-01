import '../../../data/datasource/local/database_repository.dart';
import '../../entity/fav_movie.dart';
import '../usecase_interface/i_save_fav_movie_usecase.dart';

class SaveFavMovieUseCase extends ISaveFavMovieUseCase {
  final DatabaseRepository databaseRepository;

  SaveFavMovieUseCase({
    required this.databaseRepository,
  });

  @override
  Future<void> saveFavMovie(FavouriteMovies favouriteMovie) async {
    await databaseRepository.saveFavMovie(favouriteMovie);
  }
}
