import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_genre.dart';
import '../../../domain/repository/i_database_repository.dart';
import 'movie_database.dart';

class DatabaseRepository implements IDatabaseRepository {
  final MovieDatabase _movieDatabase;

  DatabaseRepository(this._movieDatabase);

  @override
  Future<List<Movie>> getSavedMovies(String category) async {
    return _movieDatabase.movieDao.getAllMovies(category);
  }

  @override
  Future<void> saveMovie(
    Movie movie,
    String category,
  ) async {
    Movie? exists = await existMovie(movie);
    if (exists != null) {
      if (!exists.category.contains(category)) {
        exists.category.add(category);
        await _movieDatabase.movieDao.insertMovie(exists);
      }
    } else {
      await _movieDatabase.movieDao.insertMovie(movie);
    }
  }

  @override
  Future<Movie?> existMovie(Movie movie) {
    return _movieDatabase.movieDao.findMovieById(movie.id);
  }

  @override
  Future<void> deleteGenre() async {
    _movieDatabase.movieGenreDao.deleteGenre();
  }

  @override
  Future<List<MovieGenre>> getSavedGenres() async {
    return _movieDatabase.movieGenreDao.getAllGenres();
  }

  @override
  Future<void> saveGenre(MovieGenre movieGenre) async {
    await _movieDatabase.movieGenreDao.insertGenre(movieGenre);
  }
}
