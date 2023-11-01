import '../../../data/datasource/local/database_repository.dart';
import '../../entity/fav_movie.dart';
import '../usecase_interface/i_delete_fav_movie_usecase.dart';

class DeleteFavMovieUseCase extends IDeleteFavMovieUseCase {
  final DatabaseRepository databaseRepository;

  DeleteFavMovieUseCase({
    required this.databaseRepository,
  });

  @override
  Future<void> deleteFavouriteMovie(FavouriteMovies favouriteMovies) async {
    await databaseRepository.deleteFavMovie(favouriteMovies);
  }
}
