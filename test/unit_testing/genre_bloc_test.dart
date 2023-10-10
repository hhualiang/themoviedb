import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/core/util/data_state.dart';
import 'package:themovietb/src/data/model/genres_model.dart';
import 'package:themovietb/src/domain/entity/genre_state.dart';
import 'package:themovietb/src/domain/entity/movie_genre.dart';
import 'package:themovietb/src/domain/usecase/usecase_impl/get_genres_usecase_impl.dart';
import 'package:themovietb/src/presentation/bloc/movie_genres_controller.dart';

class MockUseCase extends Mock implements GetGenresUseCase {}

void main() {
  late MovieGenresController genreBloc;
  late GetGenresUseCase getGenresUseCase;

  setUp(() {
    getGenresUseCase = MockUseCase();
    genreBloc = MovieGenresController(getGenresUseCase: getGenresUseCase);
  });
  final mockResult = [
    MovieGenre(id: 1, name: 'action'),
    MovieGenre(id: 2, name: 'family')
  ];
  test(
      'The stream in genrebloc should return first a GenresState.loading and then a GenresState.success when the fetch was successful',
      () {
    when(() => getGenresUseCase.getGenresModel())
        .thenAnswer((_) async => DataSuccess(GenreModel(result: mockResult)));

    Stream<GenresState> result = genreBloc.genresStream;
    final expected = [
      GenresState.loading(),
      GenresState.success(genreList: [])
    ];
    expect(result, emitsInOrder(expected));
    genreBloc.fetchGenres();
  });
  test(
      'The stream in genrebloc should retunr first a GenresState.laoding and then a GenresState.error when the fetch was unsuccessful',
      () {
    when(() => getGenresUseCase.getGenresModel())
        .thenAnswer((_) async => DataFailed('error'));

    Stream<GenresState> result = genreBloc.genresStream;
    final expected = [GenresState.loading(), GenresState.error(error: 'error')];
    expect(result, emitsInOrder(expected));
    genreBloc.fetchGenres();
  });
}
