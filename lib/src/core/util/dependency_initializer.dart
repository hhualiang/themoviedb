import '../../data/datasource/local/database_repository.dart';
import '../../data/datasource/local/movie_database.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/usecase/usecase_impl/delete_fav_movie_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/get_fav_movie_by_id_impl.dart';
import '../../domain/usecase/usecase_impl/get_fav_movie_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/get_genres_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/get_movies_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/save_fav_movie_usecase_impl.dart';
import '../../presentation/bloc/fav_movie_controller.dart';
import '../../presentation/bloc/movie_controller.dart';
import '../../presentation/bloc/movie_genres_controller.dart';

class DependencyInitializer {
  static const String databaseName = 'movie_database2.db';
  late MovieDatabase _movieDatabase;
  late MovieController _movieController;
  late MovieDetailsController _genresController;
  late MovieRepository _movieRepository;
  late DatabaseRepository _databaseBaseRepository;
  late FavouriteMovieController _favouriteMovieController;

  Future<void> initialize() async {
    _movieRepository = MovieRepository.instance();
    _movieDatabase =
        await $FloorMovieDatabase.databaseBuilder(databaseName).build();
    _databaseBaseRepository = DatabaseRepository(_movieDatabase);
    _genresController = MovieDetailsController(
      getGenresUseCase: GetGenresUseCase(
        repository: _movieRepository,
        databaseRepository: _databaseBaseRepository,
      ),
    );
    _movieController = MovieController(
      getMoviesUseCase: GetMoviesUseCase(
        repository: _movieRepository,
        dataBaseRepository: _databaseBaseRepository,
      ),
    );
    _favouriteMovieController = FavouriteMovieController(
      getFavMovieUseCase: GetFavMovieUseCase(
        databaseRepository: _databaseBaseRepository,
      ),
      saveFavMovieUseCase: SaveFavMovieUseCase(
        databaseRepository: _databaseBaseRepository,
      ),
      deleteFavMovieUseCase: DeleteFavMovieUseCase(
        databaseRepository: _databaseBaseRepository,
      ),
      getFavMovieByIdUseCase: GetFavMovieByIdUseCase(
        databaseRepository: _databaseBaseRepository,
      ),
    );
  }

  MovieDatabase get movieDatabase => _movieDatabase;

  MovieController get movieController => _movieController;

  MovieDetailsController get genresController => _genresController;

  FavouriteMovieController get favMovieController => _favouriteMovieController;
}
