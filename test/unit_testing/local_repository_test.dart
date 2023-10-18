import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/data/datasource/local/DAOs/movie_dao.dart';
import 'package:themovietb/src/data/datasource/local/DAOs/movie_genre_dao.dart';
import 'package:themovietb/src/data/datasource/local/database_repository.dart';
import 'package:themovietb/src/data/datasource/local/movie_database.dart';
import 'package:themovietb/src/domain/entity/movie.dart';

class MockDatabase extends MovieDatabase {
  @override
  MovieDao movieDao;

  @override
  MovieGenreDao movieGenreDao;

  MockDatabase(this.movieDao, this.movieGenreDao);
}

class MockMovieDao extends Mock implements MovieDao {}

class MockGenreDao extends Mock implements MovieGenreDao {}

void main() {
  late MovieDatabase movieDatabase;
  late DatabaseRepository repository;
  late MovieDao movieDao;
  late MovieGenreDao movieGenreDao;
  setUp(() {
    movieDao = MockMovieDao();
    movieGenreDao = MockGenreDao();
    movieDatabase = MockDatabase(movieDao, movieGenreDao);
    repository = DatabaseRepository(movieDatabase);
  });

  final movie = Movie(
    adult: false,
    backdropPath: '',
    genreIds: [20],
    id: 2,
    originalLanguage: 'English',
    originalTitle: 'title2',
    overviewText: 'overview',
    popularity: 200,
    posterPath: ' ',
    releaseDate: '01-01-2001',
    title: 'title2',
    hasVideo: false,
    movieRating: 10,
    voteCount: 200,
    category: ['top'],
  );
  test('Verify that my local repository ', () {
    when(
      () => movieDao.getAllMovies(
        any(),
      ),
    ).thenAnswer(
      (_) => Future.value(<Movie>[movie]),
    );
    final actual = repository.getSavedMovies('category');

    expect(
      actual,
      isInstanceOf<Future<List<Movie>>>(),
    );
  });
}
