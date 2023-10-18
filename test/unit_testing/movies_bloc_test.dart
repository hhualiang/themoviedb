import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/core/util/data_state.dart';
import 'package:themovietb/src/domain/entity/movie_state.dart';
import 'package:themovietb/src/domain/usecase/usecase_impl/get_movies_usecase_impl.dart';
import 'package:themovietb/src/presentation/bloc/movie_controller.dart';

class MockUseCase extends Mock implements GetMoviesUseCase {}

void main() {
  late MovieController moviesBloc;
  late GetMoviesUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockUseCase();
    moviesBloc = MovieController(getMoviesUseCase: mockUseCase);
  });
  test(
      'when trying to get the movies my bloc should return a stream of movies after fetching them through my useCase from the repository',
      () {
    when(() => mockUseCase.getMovieList(any())).thenAnswer(
      (_) async => DataSuccess([]),
    );

    Stream<MovieState> result = moviesBloc.moviesStream;
    final expected = [MovieState.loading(), MovieState.success(movieList: [])];
    expect(result, emitsInOrder(expected));

    moviesBloc.fetchMovieByCategory('category');
  });

  test(
      'when trying to get the movies my bloc should return a stream of movies after fetching them through my useCase from the repository',
      () {
    when(() => mockUseCase.getMovieList(any()))
        .thenAnswer((_) async => DataFailed('error'));

    Stream<MovieState> result = moviesBloc.moviesStream;
    final expected = [MovieState.loading(), MovieState.error(error: 'error')];
    expect(result, emitsInOrder(expected));
    moviesBloc.fetchMovieByCategory('category');
  });

  tearDown(() {
    moviesBloc.dispose();
  });
}
