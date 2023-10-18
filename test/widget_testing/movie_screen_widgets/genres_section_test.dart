import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovietb/src/core/util/genres_converter.dart';
import 'package:themovietb/src/domain/entity/genre_state.dart';
import 'package:themovietb/src/domain/entity/movie_genre.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_genres/genres_section.dart';

class MockGenresState extends Mock implements GenresState {}

class MockConverter extends Mock implements GenresConverter {}

void main() {
  late GenresState mockGenres;
  late StreamController<GenresState> stream;
  late GenresConverter genresConverter;
  setUp(() {
    genresConverter = MockConverter();
    mockGenres = MockGenresState();
    stream = StreamController<GenresState>();
  });
  final List<int> ids = [28, 12];
  final List<MovieGenre> mockGenreList = [MovieGenre(id: 1, name: 'action')];

  testWidgets(
    'Verify that genresSection widget is displayed and rendered correctly when success fetch',
    (WidgetTester tester) async {
      when(() => genresConverter.getGenresByIds(any(), any()))
          .thenReturn(<String>['Action', 'Aventura']);
      mockGenres = GenresState.success(genreList: mockGenreList);
      stream.sink.add(mockGenres);
      await tester.pumpWidget(
        MaterialApp(
          home: GenresSection(
            genresIds: ids,
            genresStream: stream.stream,
          ),
        ),
      );

      expect(
        find.byKey(const Key('movieDetailsGenresSection')),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('genresSectionListView')), findsOneWidget);
    },
  );
  testWidgets(
      'Verify that genresSection widget is displayed and rendered correctly when state is loading',
      (WidgetTester tester) async {
    mockGenres = GenresState.loading();
    stream.sink.add(mockGenres);
    await tester.pumpWidget(
      MaterialApp(
        home: GenresSection(
          genresIds: ids,
          genresStream: stream.stream,
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets(
      'Verify that genresSection widget is displayed and rendered correctly when state is error',
      (WidgetTester tester) async {
    const String mockError = 'Error';
    mockGenres = GenresState.error(error: mockError);
    stream.sink.add(mockGenres);
    await tester.pumpWidget(
      MaterialApp(
        home: GenresSection(
          genresIds: ids,
          genresStream: stream.stream,
        ),
      ),
    );
    await tester.pump();
    expect(find.text(mockError), findsOneWidget);
  });
}
