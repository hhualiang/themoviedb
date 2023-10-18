import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/core/util/data_state.dart';
import 'package:themovietb/src/data/datasource/local/database_repository.dart';
import 'package:themovietb/src/data/datasource/local/movie_database.dart';
import 'package:themovietb/src/data/model/genres_model.dart';
import 'package:themovietb/src/data/model/movie_model.dart';
import 'package:themovietb/src/data/repository/movie_repository.dart';
import 'package:themovietb/src/domain/entity/movie.dart';
import 'package:themovietb/src/domain/entity/movie_genre.dart';
import 'package:themovietb/src/domain/usecase/usecase_impl/get_genres_usecase_impl.dart';
import 'package:themovietb/src/domain/usecase/usecase_impl/get_movies_usecase_impl.dart';

class MockRepository extends Mock implements MovieRepository {}

class MockDatabaseRepository extends Mock implements DatabaseRepository {

  @override
  Future<void> saveGenre(MovieGenre movieGenre) async {
    final testDatabase =
    await $FloorMovieDatabase.inMemoryDatabaseBuilder().build();
    await testDatabase.movieGenreDao.insertGenre(movieGenre);
  }

  @override
  Future<void> saveMovie(
      Movie movie,
      String category,
      ) async {
    final testDatabase =
    await $FloorMovieDatabase.inMemoryDatabaseBuilder().build();
    Movie? exists = await existMovie(movie);
    if (exists != null) {
      if (!exists.category.contains(category)) {
        exists.category.add(category);
        await testDatabase.movieDao.insertMovie(exists);
      }
    } else {
      await testDatabase.movieDao.insertMovie(movie);
    }
  }
}

void main() {
  late GetMoviesUseCase getMoviesUseCase;
  late GetGenresUseCase getGenresUseCase;
  late MovieRepository repository;
  late DatabaseRepository databaseRepository;
  setUp(() {
    repository = MockRepository();
    databaseRepository = MockDatabaseRepository();
    getMoviesUseCase = GetMoviesUseCase(
      repository: repository,
      dataBaseRepository: databaseRepository,
    );
    getGenresUseCase = GetGenresUseCase(
      repository: repository,
      databaseRepository: databaseRepository,
    );
  });
  final List<MovieGenre> mockResult = [
    MovieGenre(id: 1, name: 'action'),
    MovieGenre(id: 2, name: 'family')
  ];
  final List<Movie> mockMovieList = [
    Movie(
      adult: false,
      backdropPath: '',
      genreIds: [20],
      id: 1,
      originalLanguage: 'English',
      originalTitle: 'title',
      overviewText: 'overview',
      popularity: 200,
      posterPath: ' ',
      releaseDate: '01-01-2001',
      title: 'title',
      hasVideo: false,
      movieRating: 10,
      voteCount: 200,
      category: [],
    ),
    Movie(
      adult: false,
      backdropPath: '',
      genreIds: [20],
      id: 2,
      originalLanguage: 'English',
      originalTitle: 'title1',
      overviewText: 'overview',
      popularity: 200,
      posterPath: ' ',
      releaseDate: '01-01-2001',
      title: 'title1',
      hasVideo: false,
      movieRating: 10,
      voteCount: 200,
      category: [],
    ),
  ];
  test(
      'getMovieList() from GetMoviesUseCase should return a instance of Future<DataState<List<Movie>>>',
      () async {
    when(() => repository.fetchMoviesFromAPI(any())).thenAnswer(
      (_) => Future.value(
        DataSuccess<MovieModel>(
          MovieModel(
            page: 1,
            totalResults: 1,
            totalPages: 1,
            result: [mockMovieList[0]],
          ),
        ),
      ),
    );
    when(() => databaseRepository.getSavedMovies(any()))
        .thenAnswer((_) => Future.value(mockMovieList));
    final DataState<List<Movie>> result =
        await getMoviesUseCase.getMovieList('category');
    expect(result, isInstanceOf<DataState<List<Movie>>>());
  });

  test(
      'getGenresList() from GetGenresUseCase should return a instance of Future<DataState<List<MovieGenre>>>',
      () async {
    when(() => repository.fetchGenresFromAPI()).thenAnswer(
      (_) => Future.value(
        DataSuccess<GenreModel>(
          GenreModel(
            result: mockResult,
          ),
        ),
      ),
    );
    when(() => databaseRepository.getSavedGenres())
        .thenAnswer((_) => Future.value(mockResult));
    final DataState<List<MovieGenre>> result =
        await getGenresUseCase.getGenreList();
    expect(result, isInstanceOf<DataState<List<MovieGenre>>>());
  });
}
