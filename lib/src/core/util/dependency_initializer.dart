import '../../data/datasource/local/database_repository.dart';
import '../../data/datasource/local/movie_database.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/usecase/usecase_impl/get_genres_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/get_movies_usecase_impl.dart';
import '../../presentation/bloc/movie_controller.dart';
import '../../presentation/bloc/movie_genres_controller.dart';

class DependencyInitializer {
  static const String databaseName = 'movie_database.db';
  late MovieDatabase _movieDatabase;
  late MovieController _movieController;
  late MovieGenresController _genresController;
  late MovieRepository _movieRepository;
  late DatabaseRepository _databaseBaseRepository;

  Future<void> initialize() async {
    _movieRepository = MovieRepository.instance();
    _movieDatabase =
        await $FloorMovieDatabase.databaseBuilder(databaseName).build();
    _databaseBaseRepository = DatabaseRepository(_movieDatabase);
    _genresController = MovieGenresController(
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
  }

  MovieDatabase get movieDatabase => _movieDatabase;

  MovieController get movieController => _movieController;

  MovieGenresController get genresController => _genresController;
}
