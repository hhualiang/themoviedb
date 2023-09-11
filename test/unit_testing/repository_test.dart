import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/core/util/data_state.dart';
import 'package:themovietb/src/data/datasource/remote/movie_api_provider.dart';
import 'package:themovietb/src/data/model/genres_model.dart';
import 'package:themovietb/src/data/model/movie_model.dart';
import 'package:themovietb/src/data/repository/movie_repository.dart';

class MockMovieApiProvider extends Mock implements MovieApiProvider {}

void main() {
  final List<Map<String, Object>> movies = [
    {
      "adult": false,
      "backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
      "genre_ids": [14, 28, 12],
      "id": 455476,
      "original_language": "en",
      "original_title": "Knights of the Zodiac",
      "overview":
          "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
      "popularity": 3963.447,
      "poster_path": "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg",
      "release_date": "2023-04-27",
      "title": "Knights of the Zodiac",
      "video": false,
      "vote_average": 6.5,
      "vote_count": 367
    },
  ];
  final Map<String, Object> movieJson = {
    "page": 1,
    "total_results": 1,
    "total_pages": 1,
    "results": movies,
  };
  final Map<String, List<Map<String, Object>>> genreJson = {
    "genres": [
      {"id": 28, "name": "Action"},
      {"id": 12, "name": "Adventure"},
      {"id": 16, "name": "Animation"}
    ]
  };
  late MovieRepository movieRepository;
  late MovieApiProvider movieApiProvider;

  setUp(() {
    movieApiProvider = MockMovieApiProvider();
    movieRepository = MovieRepository(moviesApiProvider: movieApiProvider);
  });
  group(
      'My repository should return a datastate depending on the response it gets from the api service ',
      () {
    test(
        'fetchMoviesFromApi should return a DataSuccess<MovieModel> when api fetch success',
        () async {
      when(() => movieApiProvider.fetchMovieList(any()))
          .thenAnswer((_) => Future.value(DataSuccess(movieJson)));
      DataState<MovieModel> result =
          await movieRepository.fetchMoviesFromAPI('category');
      expect(result, isInstanceOf<DataSuccess<MovieModel>>());
    });

    test(
        'fetchMoviesFromApi should return a DataFailed<MovieModel> when api fetch failure',
        () async {
      when(() => movieApiProvider.fetchMovieList(any()))
          .thenAnswer((_) => Future.value(DataFailed('error')));
      DataState<MovieModel> result =
          await movieRepository.fetchMoviesFromAPI('category');
      expect(result, isInstanceOf<DataFailed<MovieModel>>());
    });

    test(
        'fetchGenresFromApi should return a DataSuccess<GenreModel> when api fetch success',
        () async {
      when(() => movieApiProvider.fetchMovieGenres()).thenAnswer(
        (_) => Future.value(
          DataSuccess<dynamic>(
            jsonEncode(genreJson),
          ),
        ),
      );
      DataState<GenreModel> result = await movieRepository.fetchGenresFromAPI();
      expect(result, isInstanceOf<DataSuccess<GenreModel>>());
    });

    test(
        'fetchGenresFromApi should return a DataFailed<GenreModel> when api fetch failure',
        () async {
      when(() => movieApiProvider.fetchMovieGenres())
          .thenAnswer((_) => Future.value(DataFailed('error')));
      DataState<GenreModel> result = await movieRepository.fetchGenresFromAPI();
      expect(result, isInstanceOf<DataFailed<GenreModel>>());
    });
  });
}
