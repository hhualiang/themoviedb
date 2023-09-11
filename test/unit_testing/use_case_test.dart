import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/core/util/data_state.dart';
import 'package:themovietb/src/data/model/genres_model.dart';
import 'package:themovietb/src/data/model/movie_model.dart';
import 'package:themovietb/src/data/repository/movie_repository.dart';
import 'package:themovietb/src/domain/entity/movie_genre.dart';
import 'package:themovietb/src/domain/usecase/usecase_impl/get_genres_usecase_impl.dart';
import 'package:themovietb/src/domain/usecase/usecase_impl/get_movies_usecase_impl.dart';

class MockRepository extends Mock implements MovieRepository {}

void main() {
  late GetMoviesUseCase getMoviesUseCase;
  late GetGenresUseCase getGenresUseCase;
  late MovieRepository repository;
  setUp(() {
    repository = MockRepository();
    getMoviesUseCase = GetMoviesUseCase(repository: repository);
    getGenresUseCase = GetGenresUseCase(repository: repository);
  });
  final mockResult = [
    MovieGenre(id: 1, name: 'action'),
    MovieGenre(id: 2, name: 'family')
  ];
  test(
      'getMovieModel() from GetMoviesUseCase should return a instance of Future<DataState<MovieModel>>',
      () async {
    when(() => repository.fetchMoviesFromAPI(any())).thenAnswer(
      (_) => Future.value(
        DataSuccess<MovieModel>(
          MovieModel(
            page: 1,
            totalResults: 1,
            totalPages: 1,
            result: [],
          ),
        ),
      ),
    );
    final result = await getMoviesUseCase.getMovieModel('category');
    expect(result, isInstanceOf<DataState<MovieModel>>());
  });
  test(
      'getGenresModel() fro GetGenresUseCase should return a instance of Future<DataState<GenresModel>>',
      () async {
    when(() => repository.fetchGenresFromAPI()).thenAnswer(
      (_) => Future.value(
        DataSuccess<GenreModel>(GenreModel(result: mockResult)),
      ),
    );
    final result = await getGenresUseCase.getGenresModel();
    expect(result, isInstanceOf<DataState<GenreModel>>());
  });
}
