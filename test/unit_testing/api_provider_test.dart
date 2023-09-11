import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/core/util/data_state.dart';
import 'package:themovietb/src/data/datasource/remote/movie_api_provider.dart';

class MockClient extends Mock implements Client {}

void main() {
  late Client client;
  late MovieApiProvider movieApiProvider;
  setUpAll(() {
    client = MockClient();
    movieApiProvider = MovieApiProvider(client: client);
    registerFallbackValue(Uri());
  });

  test(
    'When client returns a status ok the api provider should return a DataSuccess',
    () async {
      when(() => client.get(any())).thenAnswer(
        (_) => Future.value(Response("{\"status\": \"ok\"}", HttpStatus.ok)),
      );
      final result = await movieApiProvider.fetchMovieList('asd');
      expect(result, isInstanceOf<DataSuccess<dynamic>>());
    },
  );

  test(
      'When client returns a status failed the api provider should return a DataFailure',
      () async {
    when(() => client.get(any())).thenAnswer(
      (_) => Future.value(Response("Fetch failed", HttpStatus.badGateway)),
    );
    final result = await movieApiProvider.fetchMovieList('asd');
    expect(result, isInstanceOf<DataFailed<dynamic>>());
  });

  test(
      'When client returns a status failed the api provider should return a DataFailure',
      () async {
    when(() => client.get(any())).thenAnswer(
      (_) => Future.value(Response("Fetch failed", HttpStatus.badGateway)),
    );
    final result = await movieApiProvider.fetchMovieGenres();
    expect(result, isInstanceOf<DataFailed<dynamic>>());
  });

  test(
    'When client returns a status ok the api provider should return a DataSuccess',
    () async {
      when(() => client.get(any())).thenAnswer(
        (_) => Future.value(Response("{\"status\": \"ok\"}", HttpStatus.ok)),
      );
      final result = await movieApiProvider.fetchMovieGenres();
      expect(result, isInstanceOf<DataSuccess<dynamic>>());
    },
  );
}
